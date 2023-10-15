//
//  NetworkManager.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//

import Foundation
import Combine

class NetworkManager{
	
	static let token = "67a186f4-a187-48a3-b56b-84230865d6a5"
	
	static func download(url: URL) -> AnyPublisher<Data, Error>{
		
		var request = URLRequest(url: url)
		request.setValue("67a186f4-a187-48a3-b56b-84230865d6a5", forHTTPHeaderField: "X-API-KEY")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let sessionConfiguration = URLSessionConfiguration.default
		
		sessionConfiguration.httpAdditionalHeaders = [
			"Authorization": "Bearer \(token)"
		]
		
		let session = URLSession(configuration: sessionConfiguration)
		
		return session.dataTaskPublisher(for: request)
			.subscribe(on: DispatchQueue.global(qos: .default))
			.tryMap{ try handleHTTPResponse(output: $0, url: url) }
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
		
	}
	
	static func handleHTTPResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
		guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
			return Data()
		}
		return output.data
	}
	
}
