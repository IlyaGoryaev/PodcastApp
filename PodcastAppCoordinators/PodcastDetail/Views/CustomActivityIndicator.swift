//
//  CustomActivityIndicator.swift
//  PodcastApp
//
//  Created by Илья Горяев on 15.10.2023.
//
import SwiftUI

struct CustomActivityIndicator: View {
	@State var isLoading = false
	
	var body: some View {
		ZStack {
			Circle()
				.trim(from: 0, to: 1)
				.stroke(
					AngularGradient(gradient: Gradient(colors: [Color.clear, Color.purpleAppColor]), center: .center),
					style: StrokeStyle(lineWidth: 4, lineCap: .round)
				)
				.frame(width: 28, height: 28, alignment: .center)
				.rotationEffect(Angle(degrees: isLoading ? 0 : -360))
				.onAppear() {
					withAnimation(
						Animation
							.linear(duration: 1)
							.repeatForever(autoreverses: false)
					) {
						isLoading.toggle()
					}
				}
		}
	}
}
