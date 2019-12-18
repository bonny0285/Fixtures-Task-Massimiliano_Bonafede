//
//  MatchModel.swift
//  Fixtures
//
//  Created by Massimiliano on 18/12/2019.
//  Copyright © 2019 InCrowd Sports. All rights reserved.
//

import Foundation


class MatchModel {
    
    var homeTeamName: String
    var awayTeamName: String
    var matchTime : String
    
    init(home : String, away : String, time : String) {
        self.homeTeamName = home
        self.awayTeamName = away
        self.matchTime = time
    }
}

