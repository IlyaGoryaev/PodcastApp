//
//  PodcastsImageViewModel.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//

import Foundation
import Combine
import UIKit

class PodcastsImageViewModel: ObservableObject{
	
	@Published var podcastImage: UIImage? = nil
	@Published var isLoading: Bool = false
	private var imageCache = ImageCache.getImageCache()
	
	var dataService: PodcastImageDataService
	
	var cancallabels = Set<AnyCancellable>()
	
	var stringUrl: String
	
	init(stringUrl: String){
		self.stringUrl = stringUrl
		self.dataService = PodcastImageDataService(imageUrl: stringUrl)
		self.isLoading = true
		loadImage()
	}
	
	private func loadImage(){
		if loadImageFromCache(){
			return
		}
		
		addSubscription()
	}
	
	func loadImageFromCache() -> Bool {
		guard let cacheImage = imageCache[stringUrl] else {
			return false
		}
		
		podcastImage = cacheImage
		return true
	}
	
	private func addSubscription(){
		dataService.$image
			.sink(receiveCompletion: { (_) in
				self.isLoading = false
			}, receiveValue: { [weak self] image in
				guard let image = image else {return}
				self?.imageCache[self?.stringUrl ?? ""] = image
				self?.podcastImage = image
			})
			.store(in: &cancallabels)
	}
	
}
class ImageCache {
	var cache = NSCache<NSString, UIImage>()
	
	subscript(_ key: String) -> UIImage? {
		get { cache.object(forKey: key as NSString) }
		set { newValue == nil ? cache.removeObject(forKey: key as NSString) : cache.setObject(newValue!, forKey: key as NSString) }
	}
}

extension ImageCache {
	private static var imageCache = ImageCache()
	
	static func getImageCache() -> ImageCache {
		return imageCache
	}
}
