//
//  ViewController.swift
//  BnBVestor
//
//  Created by Thasanon, Namfon on 9/3/16.
//  Copyright © 2016 maewbox. All rights reserved.
//

import UIKit
import MapKit

protocol HandleMapSearch {
 func dropPinZoomIn (placeMark: MKPlacemark)
}

protocol TableViewCellSegmentDelegate {
    func segmentValueChanged(sender: UISegmentedControl)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var segmentDelegate: TableViewCellSegmentDelegate?
    
    var selectedPin: MKPlacemark? = nil

    let locationManager = CLLocationManager()
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    



    var resultSearchController : UISearchController? = nil
    
    var mockData = [EstimateArea]()
    

    let mockAreas = [
        EstimateArea(displayDollar: 0, zip: "10005", city: "New York", state: "NY", address: "New York NY 10005 US", latitude: 40.6998433, longtitude: -74.0072436, airbnb_avg_price_all:191, occupancy_100: 5809.58, occupancy_50: 2904.79, occupancy_25: 1452.40, airbnb_result_count: 250, monthly_mortgage_cost: 5224.969942, hotel_average: 365.73, gross_income_50: -2320.18),
        EstimateArea(displayDollar: 0, zip: "10307", city: "New York", state: "NY", address: "New York NY 10307 US", latitude: 40.5070853, longtitude: -74.2443436, airbnb_avg_price_all:80, occupancy_100: 2433.33, occupancy_50: 1216.19, occupancy_25: 625.23, airbnb_result_count: 78, monthly_mortgage_cost: 3456.86456, hotel_average: 265.73, gross_income_50: -3020.18),
        EstimateArea(displayDollar: 0, zip: "11210", city: "New York", state: "NY", address: "New York NY 11210 US", latitude: 40.7127837, longtitude: -74.0059413, airbnb_avg_price_all:183, occupancy_100: 4197.5,occupancy_50: 2004.79, occupancy_25: 1002.40, airbnb_result_count: 37468, monthly_mortgage_cost: 6543.86456, hotel_average: 465.73, gross_income_50: -1320.18)
        ]
    
    // Dollar Amount on screen
    
    @IBAction func segmentAction(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex{
        case 0 :
            for mockArea in mockAreas {
                mockArea.displayDollar = mockArea.occupancy_100 - mockArea.monthly_mortgage_cost
                updateTableViewWithSelectedSegment()
            }

        case 1 :
            for mockArea in mockAreas {
                mockArea.displayDollar = mockArea.occupancy_100
                updateTableViewWithSelectedSegment()
            }
            
        case 2 :
            for mockArea in mockAreas {
                mockArea.displayDollar = mockArea.occupancy_50
                updateTableViewWithSelectedSegment()
            }
        case 3 :
            for mockArea in mockAreas {
                mockArea.displayDollar = mockArea.occupancy_25
                updateTableViewWithSelectedSegment()
            }
        case 4 :
            for mockArea in mockAreas {
                mockArea.displayDollar = mockArea.monthly_mortgage_cost
                updateTableViewWithSelectedSegment()
            }
        default :
            for mockArea in mockAreas {
                mockArea.displayDollar = -(mockArea.gross_income_50*2)
                updateTableViewWithSelectedSegment()
            }
        }
    }
    
    func updateTableViewWithSelectedSegment() {
            tableView.reloadData()
            dropPinZoomIn(selectedPin!)
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // MARK : Mock Data
        let sortedMock = mockAreas.sort() { $0.displayDollar > $1.displayDollar }
        mockData.appendContentsOf(sortedMock)


        
        // Allow Location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        


        // Search Table
        let locationSearchTable = storyboard!.instantiateViewControllerWithIdentifier("LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        // Setup Searchbar
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search by City or Zip Code"
        navigationItem.titleView = resultSearchController?.searchBar
        
        // Configure Search bar
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        locationSearchTable.mapView = mapView
        
        locationSearchTable.handleMapSearchDelegate = self
    }
    



    
    override func viewWillAppear(animated: Bool) {
        //self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK : TABLE VIEW
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("maincell", forIndexPath: indexPath) as! MainTableViewCell
        let zipEstimate = mockData[indexPath.row]
        
        cell.dollarAmount.text = String(zipEstimate.displayDollar)
        cell.addressLabel.text = zipEstimate.address
        cell.avgNightlyLabel.text = String(zipEstimate.airbnb_avg_price_all)
        cell.numberOfListingLabel.text = String(zipEstimate.airbnb_result_count)
        cell.hotelAvgLabel.text = String(zipEstimate.hotel_average)
        cell.profitEstLabel.text = String(-(zipEstimate.gross_income_50*2))
    
        if (zipEstimate.occupancy_100 - zipEstimate.monthly_mortgage_cost) > 0{
            cell.rankImg.image = UIImage(named: "GoodPiggy")
        } else {
            cell.rankImg.image = UIImage(named: "BadPiggy")
        }


        
        return cell
    }


}


extension ViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error:: (error)")
    }

}
/*
extension ViewController: HandleMapSearch {
    func dropPinZoomIn(placemark: MKPlacemark) {
    // cache the pin
        selectedPin = placemark
    // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        mapView.setRegion(region, animated: true)
        
    }
*/
    
extension ViewController: HandleMapSearch {
        func dropPinZoomIn(placemark: MKPlacemark) {
            // cache the pin
            selectedPin = placemark
            // clear existing pins
            mapView.removeAnnotations(mapView.annotations)
            
            for mockItem in mockData {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: mockItem.latitude, longitude: mockItem.longtitude)
                annotation.title = "$"+String(mockItem.displayDollar)
                annotation.subtitle = mockItem.address
                
                mapView.addAnnotation(annotation)
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegionMake(placemark.coordinate, span)
                mapView.setRegion(region, animated: true)
                
            }
            
        }
}







