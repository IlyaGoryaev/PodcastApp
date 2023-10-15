//
//  PodcatsImage.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//

import SwiftUI
import Combine

struct PodcatsImage: View {
	
	@ObservedObject private var viewModel: PodcastsImageViewModel
	
	@State var isLoading: Bool = true
	
	var stringUrl: String
	
	init(stringUrl: String){
		self.stringUrl = stringUrl
		self._viewModel = ObservedObject(wrappedValue: PodcastsImageViewModel(stringUrl: stringUrl))
	}
	
	
	var body: some View {
		if let image = viewModel.podcastImage{
			Image(uiImage: image)
				.resizable()
				.frame(width: 350, height: 400)
				.clipShape(RoundedRectangle(cornerRadius: 40))
		} else {
			ZStack{
				RoundedRectangle(cornerRadius: 40)
					.frame(width: 350, height: 400)
					.foregroundColor(Color.gray)
				CustomActivityIndicator()
			}
			
		}
		
	}
}
