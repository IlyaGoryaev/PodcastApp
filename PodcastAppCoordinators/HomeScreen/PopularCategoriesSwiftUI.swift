//
//  PopularCategoriesSwiftUI.swift
//  PodcastApp
//
//  Created by Илья Горяев on 10.10.2023.
//

import SwiftUI

struct PopularCategoriesSwiftUI: View {
	
	var action: () -> ()
	
	var body: some View {
		VStack{
			TopViewSwiftUI(title: "Popular categories") {
				action()
			}
			ScrollView(.horizontal, showsIndicators: false){
				HStack(spacing: 16){
					ForEach(0..<4){ _ in
						CategoryItem()
					}
				}
				.padding()
			}
			
		}
	}
}

struct CategoryItem: View{
	
	@State private var isSelected: Bool = false
	
	var body: some View{
		if isSelected{
			HStack(spacing: 16){
				RoundedRectangle(cornerRadius: 8)
					.frame(width: 40, height: 40)
					.foregroundStyle(LinearGradient(colors: [.purpleAppColor, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
				VStack(alignment: .leading){
					Text("Self Development")
						.font(.system(size: 14, weight: .bold))
					Text("150+ Podcasts")
						.font(.system(size: 14, weight: .regular))
				}
			}
			.padding()
			.modifier(SelectedCategoryItemStyle())
			.onTapGesture {
				withAnimation {
					isSelected.toggle()
				}
			}
		} else {
			HStack(spacing: 16){
				RoundedRectangle(cornerRadius: 8)
					.frame(width: 40, height: 40)
					.foregroundStyle(LinearGradient(colors: [.purpleAppColor, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
				VStack(alignment: .leading){
					Text("Self Development")
						.font(.system(size: 14, weight: .bold))
					Text("150+ Podcasts")
						.font(.system(size: 14, weight: .regular))
				}
			}
			.padding()
			.modifier(UnselectedCategoryItemStyle())
			.onTapGesture {
				withAnimation {
					isSelected.toggle()
				}
			}
		}
	}
	
}

struct SelectedCategoryItemStyle: ViewModifier{
	
	func body(content: Content) -> some View {
		content
			.background(RoundedRectangle(cornerRadius: 16).foregroundStyle(Color.lightPurpleAppColor))
			.overlay {
				RoundedRectangle(cornerRadius: 16).stroke(.purple, lineWidth: 1)
			}
	}
	
}

struct UnselectedCategoryItemStyle: ViewModifier{
	func body(content: Content) -> some View {
		content
			.background(RoundedRectangle(cornerRadius: 16).foregroundStyle(Color.grayAppColor))
	}
}

#Preview {
	PopularCategoriesSwiftUI{
		print("Hello, world")
	}
}
