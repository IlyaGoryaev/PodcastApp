//
//  BunnerSwiftUI.swift
//  PodcastApp
//
//  Created by Илья Горяев on 10.10.2023.
//

import SwiftUI

struct BunnerSwiftUI: View {
	
	var action: () -> ()
	
	var body: some View {
		
		ZStack(alignment: .bottomTrailing){
			ZStack(alignment: .topLeading){
				RoundedRectangle(cornerRadius: 16)
					.foregroundStyle(Color.pinkAppColor)
				
				VStack(alignment: .leading, spacing: 0){
					VStack(alignment: .leading, spacing: 6){
						Text("Podcast App Design")
							.foregroundStyle(Color.white)
							.font(.system(size: 14, weight: .bold))
						Text("Listen to the future of UI/UX")
							.foregroundStyle(Color.white)
							.font(.system(size: 12))
					}
					.padding(.leading, 24)
					.padding(.top, 24)
					
					ZStack{
						Circle()
							.stroke(Color.white)
							.frame(width: 24, height: 24)
						Circle()
							.frame(width: 24, height: 24)
							.foregroundStyle(Color.white)
							.offset(x: 20)
					}
					.padding(.horizontal, 24)
					.padding(.top, 14)
					
					Text("Guests: Larry + Tom")
						.foregroundStyle(Color.white)
						.font(.system(size: 12))
						.padding(.horizontal, 24)
						.padding(.top, 8)
				}
			}
			Image("bro")
				.padding()
		}
		.frame(height: 128)
		.padding(.horizontal, 24)
		.onTapGesture {
			action()
		}
		
	}
}

#Preview {
	BunnerSwiftUI{
		print("Hello. world")
	}
	
}
