//
//  EstimateArea.swift
//  BnBVestor
//
//  Created by Thasanon, Namfon on 9/8/16.
//  Copyright © 2016 maewbox. All rights reserved.
//

import Foundation
import UIKit

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
    

}

/* JSON RESPONSE EXAMPLE
 
 [
 {
 "zip": "10005",
 "city": "New York",
 "state": "NY",
 "country": "US",
 "address": "New York NY 10005 US ",
 "latitude": "40.6998433",
 "longitude": "-74.0072436",
 "airbnb_avg_price_all": "191",
 "airbnb_avg_price_entire": null,
 "airbnb_avg_price_private": null,
 "airbnb_avg_price_shared": null,
 "occupancy_100": "5809.58",
 "cccupancy_75": null,
 "occupancy_50": "2904.79",
 "occupancy_25": "1452.40",
 "airbnb_result_count": "250",
 "search_radius": "887.3428946",
 "value_ratio": "0.004639871682",
 "avergage_property_price": "1252100",
 "monthly_mortgage_cost": "5224.969942",
 "gross_income_50": "-2320.18",
 "appreciation_month": "0.005783597076",
 "appreciation_quarter": "0.01557303918",
 "appreciation_year": "0.06380628717",
 "appreciation_5": "0.05347040718",
 "appreciation_10": "0.04296908785",
 "pct_fall_from_peak": "0",
 "peak_price": "1252100",
 "peak_quarter": "2015-Q3",
 "hotel_average": "365.73",
 "hotel_property_count": "545",
 "airbnb_hotel_diff": "-174.73"
 }
 ]
 
 
 */





