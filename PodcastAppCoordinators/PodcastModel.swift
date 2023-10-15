//
//  PodcastModel.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//

import Foundation
import SwiftUI

struct PodcastModel: Decodable{
	
	var filmId: Int
	var nameRu: String
	var year: String
	var rating: String
	var ratingVoteCount: Int
	var posterUrl: String
	var posterUrlPreview: String
	
}
struct PodcastListModel: Decodable{
	
	var pagesCount: Int
	var films: [PodcastModel]
	
}

