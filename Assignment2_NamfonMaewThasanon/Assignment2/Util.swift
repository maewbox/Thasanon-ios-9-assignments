//
//  Util.swift
//  Assignment2
//
//  Created by Thasanon, Namfon on 7/7/16.
//  Copyright © 2016 maew. All rights reserved.
//

import Foundation
class Util {

    func intValueFrom(text: String?) -> Int? {
        if let testStr = text{
            return Int(testStr)
        }
        return nil
    }

    func int32ValueFrom(text: String?) -> UInt32? {
        if let testStr = text{
            return UInt32(testStr)
        }
        return nil
    }
    
    func doubleValueFrom (text: String?) -> Double?{
        if let testStr = text{
            return Double(testStr)
        }
        return nil
    }


}