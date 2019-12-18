//
//  FixtureTableViewCell.swift
//  Fixtures
//
//  Created by Massimiliano on 18/12/2019.
//  Copyright © 2019 InCrowd Sports. All rights reserved.
//

import UIKit

class FixtureTableViewCell: UITableViewCell {

    
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
