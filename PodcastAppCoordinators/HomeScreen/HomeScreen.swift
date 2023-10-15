//
//  HomeScreen.swift
//  PodcastApp
//
//  Created by Илья Горяев on 10.10.2023.
//

import SwiftUI

struct HomeScreen: View {
	
	@State var textField: String = ""
	
	var action: () -> ()
	
	var body: some View {
		ScrollView{
			VStack(spacing: 24){
				HStack{
					ProfileViewHomeScreen()
						.padding(.horizontal, 24)
					Spacer()
					Image(systemName: "bell.badge")
						.padding(.horizontal, 24)
				}
				SearchView(text: $textField)
				BunnerSwiftUI{
					print("Hello")
				}
				PopularCategoriesSwiftUI {
					print("Popular categories")
				}
				NewReleaseSwiftUI{
					action()
				}
			}
		}
	}
}

struct SearchView: View{
	
	@Binding var text: String
	
	var body: some View{
		HStack{
			HStack(spacing: 16){
				Image("search")
				TextField(text: $text) {
					Text("What would you like to listen?")
				}
			}
			Image("filter")
		}
		.padding()
		.background(RoundedRectangle(cornerRadius: 16 ).foregroundStyle(Color.grayAppColor))
		.padding(.horizontal, 24)
		
	}
	
}


struct ProfileViewHomeScreen: View{
	
	var body: some View{
		
		HStack{
			RoundedRectangle(cornerRadius: 8)
				.frame(width: 40, height: 40)
			VStack(alignment: .leading){
				Text("Good Morning")
					.font(.system(size: 14, weight: .light))
				Spacer()
					.foregroundStyle(Color.gray)
				Text("Andrew Smith")
					.font(.system(size: 16, weight: .bold))
			}
		}
	}
}

#Preview {
	HomeScreen{
		print("Hello, world")
	}
}
