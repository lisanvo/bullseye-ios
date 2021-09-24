//
//  RoundViews.swift
//  Bullseye
//
//  Created by Lisa Vo on 9/1/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
	var systemName: String
	
	var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundColor(Color("TextColor"))
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			.overlay(
				Circle()
					.strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
			)
	}
}

struct RoundedImageViewFilled: View {
	var systemName: String
	
	var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundColor(Color("ButtonFilledTextColor"))
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			// we want behind so we use background
			// if we want on top, we use overlay
			.background (
				Circle()
					.fill(Color("ButtonFilledBackgroundColor"))
			)
	}
}

struct RoundRectTextView: View {
	var text: String
	
	var body: some View {
		Text(text)
			.kerning(-0.2) // Figma: letter-spacing
			.bold()
			.font(.title3) // use Typography site to round px to nearest font
			.frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
			.foregroundColor(Color("TextColor"))
			.overlay(
				RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
					.strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
			)
	}
}

struct PreviewView: View {
	var body: some View {
		VStack(spacing: 10) {
			RoundedImageViewStroked(systemName: "arrow.counterclockwise")
			RoundedImageViewFilled(systemName: "list.dash")
			RoundRectTextView(text: "999")
		}
	}
}

struct RoundViews_Previews: PreviewProvider {
	static var previews: some View {
		PreviewView()
		PreviewView()
			.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
	}
}
