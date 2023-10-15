//
//  ContentView.swift
//  PodcastApp
//
//  Created by Илья Горяев on 10.10.2023.
//

import SwiftUI

struct ContentView: View {
	
	@State var selectedCatgory: String = "house"
	
	weak var mainCoordinator: MainCoordinator?
	
	var body: some View {
		ZStack(alignment: .bottom){
			VStack{
				HomeScreen {
					mainCoordinator?.openDetailScreen()
				}
				TabBarSwiftUI(selectedItem: $selectedCatgory)
					.padding(.horizontal, 32)
					.padding(.top, 20)
					.background(Color.white)
					.ignoresSafeArea()
			}
			
		}
	}
}

#Preview {
	ContentView()
}
