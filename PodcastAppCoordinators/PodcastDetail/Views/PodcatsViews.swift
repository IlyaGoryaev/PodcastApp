//
//  PodcatsViews.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//

import SwiftUI
import Combine

struct TracksView: View {
	
	@Binding var isFrontImageAnimated: Bool
	@Binding var isSecondaryImageAnimated: Bool
	@Binding var isBackImageAnimated: Bool
	
	@Binding var imageNames: [PodcastItem]
	@Binding var imageXOffsets: [CGFloat]
	@Binding var imageYOffsets: [CGFloat]
	@Binding var podcastIndex: Int
	var podcasts: [PodcastModel] = []
	var body: some View {
		if podcasts.isEmpty{
			
		} else {
			ZStack{
				PodcatsImage(stringUrl: podcasts[2 + podcastIndex].posterUrlPreview)
					.offset(x: imageXOffsets[imageXOffsets.count - 1])
					.offset(y: imageYOffsets[imageYOffsets.count - 1])
					.scaleEffect(0.6)
					.blur(radius: 3)
				PodcatsImage(stringUrl: podcasts[1 + podcastIndex].posterUrlPreview)
					.offset(x: imageXOffsets[imageXOffsets.count - 2])
					.offset(y: imageYOffsets[imageYOffsets.count - 2])
					.scaleEffect(0.8)
					.offset(y: 80)
					.blur(radius: 3)
				PodcatsImage(stringUrl: podcasts[0 + podcastIndex].posterUrlPreview)
					.offset(x: imageXOffsets[imageXOffsets.count - 3])
					.offset(y: imageYOffsets[imageYOffsets.count - 3])
					.offset(y: 160)
				
			}
		}
	}
}

struct PodcastDetailButtons: View{
	
	@Binding var isFrontImageAnimated: Bool
	@Binding var isSecondaryImageAnimated: Bool
	@Binding var isBackImageAnimated: Bool
	@Binding var imageNames: [PodcastItem]
	@Binding var imageXOffsets: [CGFloat]
	@Binding var imageYOffsets: [CGFloat]
	@Binding var podcastIndex: Int
	
	var body: some View{
		HStack(spacing: 38){
			//			PodcastDetailButtomItem(imageName: "next.10 2") {
			//				print("next.10 2")
			//				podcastIndex -= 1
			//			}
			PodcastDetailButtomItemReverse(imageName: "next.10 1", isEnable: podcastIndex == 0 ? false : true) {
				podcastIndex -= 1
			}
			PodcastDetailButtomItem(imageName: "Vector") {
				print("Vector")
			}
			PodcastDetailButtomItem(imageName: "play 1") {
				print("play 1")
			}
			PodcastDetailButtomItem(imageName: "Vector") {
				print("Vector")
			}
			PodcastDetailButtomItem(imageName: "next.10 1") {
				withAnimation(.linear(duration: 0.5)) {
					
					isFrontImageAnimated.toggle()
					podcastIndex += 1
				}
			}
		}
	}
	
}

struct PodcastDetailButtomItem: View {
	
	var imageName: String
	
	var action: () -> ()
	
	var body: some View {
		Button(action: {
			action()
		}, label: {
			Image(imageName)
		})
	}
}

struct PodcastDetailButtomItemReverse: View {
	
	var imageName: String
	
	var isEnable: Bool = false
	
	var action: () -> ()
	
	var body: some View {
		Button(action: {
			if isEnable {
				action()
			}
		}, label: {
			Image(imageName)
				.rotationEffect(Angle(degrees: 180))
				.opacity(isEnable ? 1 : 0.5)
		})
	}
}
