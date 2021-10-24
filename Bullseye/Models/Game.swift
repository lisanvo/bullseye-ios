//
//  Game.swift
//  Bullseye
//
//  Created by Lisa Vo on 6/28/21.
//

import Foundation

struct LeaderboardEntry {
	let score: Int
	let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
	 var leaderboardEntries: [LeaderboardEntry] = []
	
	init(loadTestData: Bool = false) {
		if loadTestData {
			leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
			leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
			leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
			leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
			leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
		}
	}
    
    func points(sliderValue: Int) -> Int {
		let difference = abs(target - sliderValue)
		let bonus: Int
		if difference == 0 {
			bonus = 100
		} else if difference <= 2 {
			bonus = 50
		} else {
			bonus = 0
		}
		return 100 - difference + bonus
    }
	
	mutating func addToLeaderboard(point: Int) {
		self.leaderboardEntries.append(LeaderboardEntry(score: point, date: Date()))
		self.leaderboardEntries.sort{ $0.score > $1.score }
	}
	
	// mutating func indicates that when you call this method, it
	// will change some values in the struct itself
	mutating func startNewRound(points: Int) {
		self.score += points
		self.round += 1
		self.target = Int.random(in: 1...100)
		
		addToLeaderboard(point: points)
	}
	
	mutating func restart() {
		score = 0
		round = 1
		target = Int.random(in: 1...100)
	}
}
