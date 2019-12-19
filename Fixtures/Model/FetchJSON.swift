//
//  FetchJSON.swift
//  Fixtures
//
//  Created by Massimiliano on 18/12/2019.
//  Copyright © 2019 InCrowd Sports. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



protocol MatchDelegate {
    func passData(forData matchs: [MatchModel])
}



class FetchJSON {
    
     var delegate : MatchDelegate?
     var matchModel = [MatchModel]()
    
    
    func fetcJSON(){
        
        let headers: HTTPHeaders = [
            "X-Auth-Token": "3ee966f08dbd47fb8bf5c3d378d541a5"
        ]
        
        Alamofire.request("http://api.football-data.org/v2/competitions/ELC/matches", headers: headers).responseJSON { (response) in
            
            let myData = response.result
            
            switch myData {
                
            case .success(let value):
                
                
                let myJSON : JSON = JSON(arrayLiteral: value)
                let matchJSON = myJSON[0]["matches"]
                
                var counter = 0
                for _ in matchJSON {
                    counter += 1
                }
                
                
                for i in 0...counter - 1 {
                    let mat = MatchModel(home: "\(matchJSON[i]["homeTeam"]["name"])", away: "\(matchJSON[i]["awayTeam"]["name"])", time: "\(matchJSON[i]["utcDate"])")
                                        
                    self.matchModel.append(mat)
                }
                self.delegate?.passData(forData: self.matchModel)
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    
   
    
    
}
