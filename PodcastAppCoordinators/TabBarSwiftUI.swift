//
//  TabBarSwiftUI.swift
//  PodcastApp
//
//  Created by Илья Горяев on 10.10.2023.
//

import SwiftUI

enum TabBarSection{
	
	case house
	case search
	case play
	case profile
	
	static var pictureNameCases: [String] = ["house", "magnifyingglass.circle", "play.circle", "person"]
	
	static var nameCases: [String: String] = ["house": "Home", "magnifyingglass.circle": "Search", "play.circle": "Play", "person": "Profile"]
}

struct TabBarSwiftUI: View {
	
	@Binding var selectedItem: String
	@Namespace private var namespace
	
	var body: some View {
		HStack{
			ForEach(TabBarSection.pictureNameCases, id: \.self){ item in
				if selectedItem == item{
					SelectedSectionTabBar(title: item.lowercased())
						.matchedGeometryEffect(id: "tabBar", in: namespace)
						.modifier(SelectedSectionTabBarModifier())
						.onTapGesture {
							withAnimation {
								selectedItem = item
							}
						}
				} else {
					UnselectedSectionTabBar(title: item.lowercased())
						.onTapGesture {
							withAnimation {
								selectedItem = item
							}
						}
				}
				if item != "person"{
					Spacer()
				}
			}
		}
	}
}

struct SelectedSectionTabBar: View {
	
	var title: String
	
	var body: some View {
		Image(systemName: title + ".fill")
			.frame(width: 24, height: 24)
			.foregroundStyle(Color.mainAppColor)
	}
}

struct SelectedSectionTabBarModifier: ViewModifier{
	func body(content: Content) -> some View {
		content
			.padding(.vertical, 8)
			.padding(.horizontal, 24)
			.background(RoundedRectangle(cornerRadius: 20).foregroundStyle(Color.purpleAppColor))
	}
}

struct UnselectedSectionTabBar: View{
	var title: String
	var body: some View{
		Image(systemName: title)
	}
	
}
//
//#Preview {
//    TabBarSwiftUI(selectedItem: State(wrappedValue: "house"))
//        .padding(.horizontal, 32)
//}
