//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Lisa Vo on 9/24/21.
//

import SwiftUI

struct LeaderboardView: View {
	var body: some View {
		ZStack {
			Color("BackgroundColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			VStack(spacing: 10) {
				HeaderView()
				LabelView()
				RowView(index: 1, score: 10, date: Date())
			}
		}
	}
}

struct RowView: View {
	let index: Int
	let score: Int
	let date: Date
	
	var body: some View {
		HStack {
			RoundedTextView(text: String(index))
			Spacer() // by default, spacers fill the available area that is given to them
			ScoreText(score: score)
				.frame(width: Constants.Leaderboard.leaderboardScoreColWidth, height: Constants.Leaderboard.leaderboardColHeight)
			Spacer()
			DateText(date: date)
				.frame(width: Constants.Leaderboard.leaderboardDateColWidth, height: Constants.Leaderboard.leaderboardColHeight)
		}
		.background(
			RoundedRectangle(cornerRadius: .infinity)
				.strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
		)
		.padding(.leading)
		.padding(.trailing)
		.frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
	}
}

struct HeaderView: View {
	var body: some View {
		ZStack {
			BigBoldText(text: "Leaderboard")
			HStack {
				Spacer()
				Button(action: {}) {
					RoundedImageViewFilled(systemName: "xmark")
						.padding(.trailing)
				}
			}
		}
	}
}

struct LabelView: View {
	var body: some View {
		HStack {
			Spacer()
				.frame(width: Constants.General.roundedViewLength)
			Spacer()
			LabelText(text: "Score")
				.frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
			Spacer()
			LabelText(text: "Date")
				.frame(width: Constants.Leaderboard.leaderboardDateColWidth)
		}
		.padding(.leading)
		.padding(.trailing)
		.frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
	}
}

struct LeaderboardView_Previews: PreviewProvider {
	static var previews: some View {
		LeaderboardView()
		LeaderboardView()
			 .previewLayout(.fixed(width: 568, height: 320))
		LeaderboardView()
			 .preferredColorScheme(.dark)
		LeaderboardView()
			 .preferredColorScheme(.dark)
			 .previewLayout(.fixed(width: 568, height: 320))
	}
}
