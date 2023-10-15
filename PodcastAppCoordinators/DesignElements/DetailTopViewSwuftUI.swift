//
//  DetailTopViewSwuftUI.swift
//  PodcastApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI

struct DetailTopViewSwuftUI: View {
	
	var title: String
	
	var action: () -> ()
	
	var body: some View {
		ZStack(alignment: .leading){
			Text(title)
				.font(.system(size: 18, weight: .bold))
				.frame(maxWidth: .infinity)
			Button(action: {
				action()
			}, label: {
				Image(systemName: "arrow.left")
					.foregroundStyle(Color.black)
					.padding(.horizontal, 24)
			})
		}
	}
}

#Preview {
	DetailTopViewSwuftUI(title: "Podcast Detail"){
		print("Podcast Detail")
	}
}
