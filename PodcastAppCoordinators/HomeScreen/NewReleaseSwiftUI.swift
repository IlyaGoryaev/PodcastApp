//
//  NewReleaseSwiftUI.swift
//  PodcastApp
//
//  Created by Илья Горяев on 10.10.2023.
//

import SwiftUI

struct NewReleaseSwiftUI: View {
	
	var action: () -> ()
	
	var body: some View {
		VStack(spacing: 24){
			TopViewSwiftUI(title: "New release") {
				action()
			}
			ForEach(0..<5){ _ in
				NewReleaseItem()
			}
		}
		.padding(24)
		.frame(maxWidth: .infinity)
		.background(RoundedRectangle(cornerRadius: 24).foregroundStyle(Color.grayAppColor))
	}
}

struct NewReleaseItem: View{
	
	var body: some View{
		
		HStack(spacing: 12){
			Image("NewReleaseView")
			VStack(alignment: .leading){
				Text("UIX Design University | Listen to the future of the UI/UX Design")
					.font(.system(size: 14, weight: .bold))
				Text("UI Breakfast  |  25:30")
				ButtonsNewReleaseItemView {
					print("Ne")
				}
			}
		}
	}
}

struct ButtonsNewReleaseItemView: View{
	
	var action: () -> ()
	
	var body: some View{
		HStack(spacing: 16){
			Button(action: {
				action()
			}, label: {
				HStack(spacing: 8){
					Image("play")
					Text("Play")
						.foregroundStyle(Color.white)
						.font(.system(size: 12, weight: .bold))
				}
				.padding(.horizontal, 16)
				.padding(.vertical, 8)
				.background(RoundedRectangle(cornerRadius: 20).foregroundStyle(Color.purpleColor))
			})
			Image("folder")
			Image("download")
			Image("more-circle")
		}
	}
}

#Preview {
	NewReleaseSwiftUI{
		print("Hello, world")
	}
}
