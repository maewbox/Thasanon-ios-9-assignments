//
//  AgeVerification.swift
//  Assignment2
//
//  Created by Thasanon, Namfon on 7/6/16.
//  Copyright © 2016 maew. All rights reserved.
//

import Foundation

class AgeVerification{
    
    func calculateAge(yearBorn: Int) -> Int {
        let currentYear = getCurrentYear()
        return currentYear - yearBorn
        
    }
    
    func getCurrentYear() -> Int {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: date)
        
        let year =  components.year

        return year
    
    }
    
    func verifyAge(age: Int) -> String {
    
        let wineStr = "You can buy wine."
        let voteStr = "You can vote."
        let driveStr = "You can drive."
        let bornStr = "You were born."
        
        var str: String! = nil
        
        if age > 21 {
            str = bornStr+" "+wineStr+" "+voteStr+" "+driveStr
        }else if age > 18{
            str = bornStr+" "+voteStr+" "+driveStr
        }else if age > 16{
            str = bornStr+" "+driveStr
        }else if age > 0 {
            str = bornStr + " You are still a baby."
        }
        
        return "You are \(age) years old. " + str
    
    }
    
    

}
