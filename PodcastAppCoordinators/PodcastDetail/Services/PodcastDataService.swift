//
//  PodcastDataService.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//

import Foundation
import Combine

class PodcastDataService{
	
	@Published var podcasts: [PodcastModel] = []
	var topPodcastsSubscription: AnyCancellable?
	
	init(){
		getPodacsts()
	}
	
	private func getPodacsts(){
		print()
		guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1") else { return }
		topPodcastsSubscription = NetworkManager.download(url: url)
			.decode(type: PodcastListModel.self, decoder: JSONDecoder())
			.sink(receiveCompletion: { (receiveCompletion) in
				switch receiveCompletion{
				case .finished:
					break
				case .failure(let error):
					print(error.localizedDescription)
				}
			}, receiveValue: { [weak self] podcasts in
				self?.podcasts = podcasts.films
				self?.topPodcastsSubscription?.cancel()
			})
		
		
	}
	
}
