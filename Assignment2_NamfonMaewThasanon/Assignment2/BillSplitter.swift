//
//  BillSplitter.swift
//  Assignment2
//
//  Created by Thasanon, Namfon on 7/6/16.
//  Copyright © 2016 maew. All rights reserved.
//

import Foundation

class BillSplitter {
    
    func calculateTip(billAmount: Double, percentTip: Double) -> Double {
        return billAmount * (percentTip/100)
    
    }

    func totlaAmount(billAmount: Double, tipAmount: Double) -> Double{
        return billAmount+tipAmount
    }
    
    func spitByPeopleNum(totalAmount: Double, peopleNum: Double) -> Double {
        return totalAmount/peopleNum
    }





}