//
//  DetailScreen.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//

import SwiftUI

struct DetailScreen: View {
	
	weak var mainCoordinator: MainCoordinator?
	
	var body: some View {
		VStack{
			DetailTopViewSwuftUI(title: "Podcast Detail") {
				mainCoordinator?.backAction()
			}
			ScrollView{
				VStack(spacing: 16){
					ForEach(0..<30){ _ in
						DetailScreenEpisodeItem(mainText: "MainText", subText: "subText"){
							mainCoordinator?.openPodcastDetailScreen()
						}
					}
				}
			}
			
		}
		
	}
}

struct DetailScreenEpisodeItem: View {
	
	var mainText: String
	
	var subText: String
	
	var action: () -> ()
	
	var body: some View {
		HStack{
			Image("Rectangle 11")
				.resizable()
				.frame(width: 56, height: 56)
			VStack(alignment: .leading){
				Text(mainText)
					.font(.system(size: 20, weight: .bold))
				Text(subText)
			}
			Spacer()
			Image("play 1")
				.resizable()
				.frame(width: 26, height: 26)
				.padding(.all, 8)
				.background(Circle().foregroundStyle(Color.white))
				.shadow(color: Color.shadowColor, radius: 1, y: 5)
				.onTapGesture(perform: {
					action()
				})
			
		}
		.frame(maxWidth: .infinity)
		.padding(.horizontal, 20)
	}
}

#Preview {
	DetailScreen()
}
