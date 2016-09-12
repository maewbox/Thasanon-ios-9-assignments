//
//  EstimateArea.swift
//  BnBVestor
//
//  Created by Thasanon, Namfon on 9/8/16.
//  Copyright © 2016 maewbox. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class EstimateArea {

    var displayDollar: Double
    let zip: String
    let city: String
    let state: String
    let address: String
    let latitude: Double
    let longtitude: Double
    let airbnb_avg_price_all: Double
    let occupancy_100: Double
    let occupancy_50: Double
    let occupancy_25: Double
    let airbnb_result_count: Int
    let monthly_mortgage_cost: Double
    let hotel_average: Double
    let gross_income_50: Double

    
    init(displayDollar: Double, zip: String, city: String, state: String, address: String, latitude: Double, longtitude: Double, airbnb_avg_price_all: Double, occupancy_100: Double, occupancy_50: Double, occupancy_25: Double, airbnb_result_count: Int, monthly_mortgage_cost: Double, hotel_average: Double, gross_income_50: Double) {
        self.displayDollar = occupancy_100 - monthly_mortgage_cost
        self.zip = zip
        self.city = city
        self.state = state
        self.address = address
        self.latitude = latitude
        self.longtitude = longtitude
        self.airbnb_avg_price_all = airbnb_avg_price_all
        self.occupancy_100 = occupancy_100
        self.occupancy_50 = occupancy_50
        self.occupancy_25 = occupancy_25
        self.airbnb_result_count = airbnb_result_count
        self.monthly_mortgage_cost = monthly_mortgage_cost
        self.hotel_average = hotel_average
        self.gross_income_50 = gross_income_50
    }
/* ----------------------- NSURL
    static func estimateArea(city: String, state: String, completion: ([EstimateArea]?) -> Void) {
        let url = NSURL(string: "https://ruv-airvestor-v1.p.mashape.com/estimators/?city=\(city)&state=\(state)")!
        let urlRequest = NSMutableURLRequest(
            URL: url,
            cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 10.0 * 1000)
        urlRequest.HTTPMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("wyWOQp9QGvmshrSDKIc7m62V0sVOp1s3C53jsnwZcrQm7wYRva", forHTTPHeaderField: "Authorization")
        urlRequest.addValue("ccADw6HROamshe1b0mSo6qks4fJxp1lbdkljsnJJXWs9gtHPSb", forHTTPHeaderField: "X-Mashape-Key")

        let dataTask = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let parser = EstimateAreaParser(data: data)
            let estimateAreaList = parser.parse()
            completion(estimateAreaList)
        }
        dataTask.resume()
    }
    
} // end  main class


class EstimateAreaParser {
    let data: NSData
    
    init(data: NSData) {
        self.data = data
    }
    
    func parse() -> [EstimateArea] {
        var estimateAreaList = [EstimateArea]()
        
        do {
            if let estimateAreaObject = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
                    if
                        let zip = estimateAreaObject["zip"] as? String,
                        let city = estimateAreaObject["city"] as? String,
                        let state = estimateAreaObject["state"] as? String,
                        let address = estimateAreaObject["address"] as? String,
                        let latitude = estimateAreaObject["latitude"] as? Double,
                        let longtitude = estimateAreaObject["longitude"] as? Double,
                        let airbnb_avg_price_all = estimateAreaObject["airbnb_avg_price_all"] as? Double,
                        let occupancy_100 = estimateAreaObject["occupancy_100"]  as? Double,
                        let occupancy_50 = estimateAreaObject["occupancy_50"] as? Double,
                        let occupancy_25 = estimateAreaObject["occupancy_25"] as? Double,
                        let airbnb_result_count = estimateAreaObject["airbnb_result_count"] as? Int,
                        let monthly_mortgage_cost = estimateAreaObject["monthly_mortgage_cost"] as? Double,
                        let hotel_average = estimateAreaObject["hotel_average"]  as? Double,
                        let gross_income_50 = estimateAreaObject["gross_income_50"] as? Double,
                        let displayDollar = occupancy_100 - monthly_mortgage_cost as? Double
                    {

                        let estimateArea = EstimateArea(displayDollar: displayDollar, zip: zip, city: city, state: state, address: address, latitude: latitude, longtitude: longtitude, airbnb_avg_price_all: airbnb_avg_price_all, occupancy_100: occupancy_100, occupancy_50: occupancy_50, occupancy_25: occupancy_25, airbnb_result_count: airbnb_result_count, monthly_mortgage_cost: monthly_mortgage_cost, hotel_average: hotel_average, gross_income_50: gross_income_50)
                        
                        estimateAreaList.append(estimateArea)
                }
            }
        }catch {
            print("EXCEPTION: no response from service")
        }
        
        return estimateAreaList
    }
} //end estimate parser
*/
    
// ---------------- ALAMOFIRE

    static func getEstimateInfo (city: String, state: String, completion: ([EstimateArea]?) -> Void) {
        
        var estimateAreaList = [EstimateArea]()
        let url = "https://ruv-airvestor-v1.p.mashape.com/estimators"
        
        Alamofire.request (
            .GET,
            url,
            parameters: ["city": city, "state": state],
            headers: ["Authorization" : "wyWOQp9QGvmshrSDKIc7m62V0sVOp1s3C53jsnwZcrQm7wYRva", "X-Mashape-Key" : "ccADw6HROamshe1b0mSo6qks4fJxp1lbdkljsnJJXWs9gtHPSb", "Accept" : "application/json"]
        )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
        
        .responseJSON { response in
            guard response.result.isSuccess else {
                print("Error while fetching data : \(response.result.error)")
                return
            }
            
            guard let responseValue = response.result.value //as? [String: AnyObject],
                //results = responseValue["results"] as? [AnyObject]
                else {
                print("Invalid information received from service")
                print(response.debugDescription)
                completion(nil)
                return
            }
            print (responseValue)
            
//            for estimateAreaObject in results {
//                if
//                    let zip = estimateAreaObject["zip"] as? String,
//                    let city = estimateAreaObject["city"] as? String,
//                    let state = estimateAreaObject["state"] as? String,
//                    let address = estimateAreaObject["address"] as? String,
//                    let latitude = estimateAreaObject["latitude"] as? Double,
//                    let longtitude = estimateAreaObject["longitude"] as? Double,
//                    let airbnb_avg_price_all = estimateAreaObject["airbnb_avg_price_all"] as? Double,
//                    let occupancy_100 = estimateAreaObject["occupancy_100"]  as? Double,
//                    let occupancy_50 = estimateAreaObject["occupancy_50"] as? Double,
//                    let occupancy_25 = estimateAreaObject["occupancy_25"] as? Double,
//                    let airbnb_result_count = estimateAreaObject["airbnb_result_count"] as? Int,
//                    let monthly_mortgage_cost = estimateAreaObject["monthly_mortgage_cost"] as? Double,
//                    let hotel_average = estimateAreaObject["hotel_average"]  as? Double,
//                    let gross_income_50 = estimateAreaObject["gross_income_50"] as? Double,
//                    let displayDollar = occupancy_100 - monthly_mortgage_cost as? Double
//                {
//                    
//                    let estimateArea = EstimateArea(displayDollar: displayDollar, zip: zip, city: city, state: state, address: address, latitude: latitude, longtitude: longtitude, airbnb_avg_price_all: airbnb_avg_price_all, occupancy_100: occupancy_100, occupancy_50: occupancy_50, occupancy_25: occupancy_25, airbnb_result_count: airbnb_result_count, monthly_mortgage_cost: monthly_mortgage_cost, hotel_average: hotel_average, gross_income_50: gross_income_50)
//                    
//                    estimateAreaList.append(estimateArea)
//                }
//
//            }
            
            if let object = responseValue as? [[String : AnyObject]] {
                for estimateAreaObject in object{
                if
                    let zip = estimateAreaObject["zip"] as? String,
                    let city = estimateAreaObject["city"] as? String,
                    let state = estimateAreaObject["state"] as? String,
                    let address = estimateAreaObject["address"] as? String,
                    let latitude = estimateAreaObject["latitude"] as? Double,
                    let longtitude = estimateAreaObject["longitude"] as? Double,
                    let airbnb_avg_price_all = estimateAreaObject["airbnb_avg_price_all"] as? Double,
                    let occupancy_100 = estimateAreaObject["occupancy_100"]  as? Double,
                    let occupancy_50 = estimateAreaObject["occupancy_50"] as? Double,
                    let occupancy_25 = estimateAreaObject["occupancy_25"] as? Double,
                    let airbnb_result_count = estimateAreaObject["airbnb_result_count"] as? Int,
                    let monthly_mortgage_cost = estimateAreaObject["monthly_mortgage_cost"] as? Double,
                    let hotel_average = estimateAreaObject["hotel_average"]  as? Double,
                    let gross_income_50 = estimateAreaObject["gross_income_50"] as? Double,
                    let displayDollar = occupancy_100 - monthly_mortgage_cost as? Double
                {
                    
                    let estimateArea = EstimateArea(displayDollar: displayDollar, zip: zip, city: city, state: state, address: address, latitude: latitude, longtitude: longtitude, airbnb_avg_price_all: airbnb_avg_price_all, occupancy_100: occupancy_100, occupancy_50: occupancy_50, occupancy_25: occupancy_25, airbnb_result_count: airbnb_result_count, monthly_mortgage_cost: monthly_mortgage_cost, hotel_average: hotel_average, gross_income_50: gross_income_50)
                    
                    estimateAreaList.append(estimateArea)
                }
              }// end for
            }
        
            //print(responseJSON)

            completion(estimateAreaList)
            
        } // end resonse json in
 
    }// end func
}// end class
/*
class EstimateAreaParser {
    let responseJson: [String: AnyObject]
    
    init(responseJson : [String : AnyObject]) {
        self.responseJson  = responseJson
    }
    
    func parse() -> [EstimateArea] {
        var estimateAreaList = [EstimateArea]()
        
        do {
            //if let estimateAreaObjects = responseJson as? [String : AnyObject] {
                for estimateAreaObject in responseJson {
                if
                    let zip = estimateAreaObject["zip"] as? String,
                    let city = estimateAreaObject["city"] as? String,
                    let state = estimateAreaObject["state"] as? String,
                    let address = estimateAreaObject["address"] as? String,
                    let latitude = estimateAreaObject["latitude"] as? Double,
                    let longtitude = estimateAreaObject["longitude"] as? Double,
                    let airbnb_avg_price_all = estimateAreaObject["airbnb_avg_price_all"] as? Double,
                    let occupancy_100 = estimateAreaObject["occupancy_100"]  as? Double,
                    let occupancy_50 = estimateAreaObject["occupancy_50"] as? Double,
                    let occupancy_25 = estimateAreaObject["occupancy_25"] as? Double,
                    let airbnb_result_count = estimateAreaObject["airbnb_result_count"] as? Int,
                    let monthly_mortgage_cost = estimateAreaObject["monthly_mortgage_cost"] as? Double,
                    let hotel_average = estimateAreaObject["hotel_average"]  as? Double,
                    let gross_income_50 = estimateAreaObject["gross_income_50"] as? Double,
                    let displayDollar = occupancy_100 - monthly_mortgage_cost as? Double
                {
                    
                    let estimateArea = EstimateArea(displayDollar: displayDollar, zip: zip, city: city, state: state, address: address, latitude: latitude, longtitude: longtitude, airbnb_avg_price_all: airbnb_avg_price_all, occupancy_100: occupancy_100, occupancy_50: occupancy_50, occupancy_25: occupancy_25, airbnb_result_count: airbnb_result_count, monthly_mortgage_cost: monthly_mortgage_cost, hotel_average: hotel_average, gross_income_50: gross_income_50)
                    
                    estimateAreaList.append(estimateArea)
                }
            }
        }catch {
            print("EXCEPTION: no response from service")
        }
        
        return estimateAreaList
    }
} //end estimate parser

*/
