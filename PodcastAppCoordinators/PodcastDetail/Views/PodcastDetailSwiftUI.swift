//
//  PodcastDetailSwiftUI.swift
//  PodcastApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI
import Combine

struct PodcastItem{
	
	var title: String
	var xOffset: CGFloat
	var yOffset: CGFloat
	
}

struct PodcastDetailSwiftUI: View {
	
	weak var mainCoordinator: MainCoordinator?
	
	@State private var isFrontImageAnimated: Bool = false
	@State private var isSecondaryImageAnimated: Bool = false
	@State private var isBackImageAnimated: Bool = false
	@State private var imageNames: [PodcastItem] = [PodcastItem(title: "Rectangle 11", xOffset: 0, yOffset: 0), PodcastItem(title: "Rectangle 11", xOffset: 0, yOffset: 0), PodcastItem(title: "Rectangle 11", xOffset: 0, yOffset: 0)]
	@State private var imageXOffsets: [CGFloat] = [0, 0, 0]
	@State private var imageYOffsets: [CGFloat] = [0, 0, 0]
	
	@ObservedObject var viewModel = PodcastsDetailViewModel()
	
	@State var isLoading: Bool = true
	@State var podcastIndex: Int = 0
	@State var sliderValue: Double = 0.0
	
	var body: some View {
		ZStack{
			LinearGradient(colors: [.purpleExtraLight, .white, .white, .white], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
			VStack{
				DetailTopViewSwuftUI(title: "Podcast Detail") {
					mainCoordinator?.backAction()
				}
				.padding(.top, 16)
				TracksView(isFrontImageAnimated: $isFrontImageAnimated, isSecondaryImageAnimated: $isSecondaryImageAnimated, isBackImageAnimated: $isBackImageAnimated, imageNames: $imageNames, imageXOffsets: $imageXOffsets, imageYOffsets: $imageYOffsets, podcastIndex: $podcastIndex, podcasts: viewModel.topPodcasts)
				if !viewModel.topPodcasts.isEmpty{
					VStack{
						Text(viewModel.topPodcasts[podcastIndex].nameRu)
							.font(.system(size: 20, weight: .bold))
						Text(viewModel.topPodcasts[podcastIndex].rating)
							.font(.system(size: 15, weight: .semibold))
						Slider(value: $sliderValue, in: 0...1000)
							.tint(Color.pink)
							.padding(.horizontal, 16)
							.onChange(of: podcastIndex) { oldValue, newValue in
								sliderValue = 0.0
							}
							.onAppear(perform: {
								setupAppearance()
							})
					}
					.padding(.top, 200)
				}
				
				
				Spacer()
				PodcastDetailButtons(isFrontImageAnimated: $isFrontImageAnimated, isSecondaryImageAnimated: $isSecondaryImageAnimated, isBackImageAnimated: $isBackImageAnimated, imageNames: $imageNames, imageXOffsets: $imageXOffsets, imageYOffsets: $imageYOffsets, podcastIndex: $podcastIndex)
			}
		}
	}
	
	func setupAppearance() {
		UISlider.appearance().thumbTintColor = UIColor(Color.pink)
	}
}


#Preview {
	PodcastDetailSwiftUI()
}
