//
//  PodcastsDetailViewModel.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//

import SwiftUI
import Combine

class PodcastsDetailViewModel: ObservableObject{
	
	@Published var topPodcasts: [PodcastModel] = []
	@Published var isLoading: Bool = false
	
	private let storage = PodcastDataService()
	private var cancallables = Set<AnyCancellable>()
	
	init(){
		self.isLoading = true
		addSubscription()
	}
	
	func addSubscription(){
		storage.$podcasts
			.sink(receiveCompletion: { (_) in
				self.isLoading = false
			}, receiveValue: { [weak self] podcasts in
				self?.topPodcasts = podcasts
			})
			.store(in: &cancallables)
	}
	
}
