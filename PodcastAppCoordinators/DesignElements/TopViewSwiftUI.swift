//
//  TopViewSwiftUI.swift
//  PodcastApp
//
//  Created by Илья Горяев on 10.10.2023.
//

import SwiftUI

struct TopViewSwiftUI: View {
	
	var title: String
	
	var action: () -> ()
	
	var body: some View {
		HStack{
			Text(title)
				.font(.system(size: 18, weight: .bold))
			Spacer()
			Button {
				action()
			} label: {
				Image(systemName: "chevron.right")
					.foregroundStyle(Color.black)
			}
		}
		.padding(.horizontal, 25)
	}
}

#Preview {
	TopViewSwiftUI(title: "Popular categories") {
		print("Popular categories")
	}
}
