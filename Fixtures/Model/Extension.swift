//
//  Extension.swift
//  Fixtures
//
//  Created by Massimiliano on 18/12/2019.
//  Copyright © 2019 InCrowd Sports. All rights reserved.
//

import Foundation


extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
