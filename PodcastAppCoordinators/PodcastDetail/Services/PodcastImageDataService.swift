//
//  PodcastImageDataService.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//

import Foundation
import Combine
import SwiftUI

final class PodcastImageDataService{
	
	@Published var image: UIImage? = nil
	var podcastImage: AnyCancellable?
	var imageUrl: String
	
	init(imageUrl: String){
		self.imageUrl = imageUrl
		getSubscription()
	}
	
	private func getSubscription(){
		guard let url = URL(string: imageUrl) else { return }
		
		podcastImage = NetworkManager.download(url: url)
			.tryMap({ (data) -> UIImage? in
				print(data.description)
				return UIImage(data: data)
			})
			.sink(receiveCompletion: { (completion) in
				switch completion{
				case .finished:
					break
				case .failure(let error):
					print(error.localizedDescription)
				}
			}, receiveValue: { [weak self] image in
				self?.image = image
				self?.podcastImage?.cancel()
			})
	}
	
	
}
