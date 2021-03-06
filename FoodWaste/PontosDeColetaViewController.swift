//
//  PontosDeColetaViewController.swift
//  FoodWaste
//
//  Created by Gabriella Lopes on 8/13/16.
//  Copyright © 2016 Andre Machado Parente. All rights reserved.
//

import UIKit
import MapKit
class CustomAnnotation: NSObject, MKAnnotation {
    init(coordinate:CLLocationCoordinate2D,title:String,subtitle:String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        super.init()
    }
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
}
class PontosDeColetaViewController: UIViewController,MKMapViewDelegate,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate{

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    var index:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
      

        checkLocationAuthorizationStatus()
        self.map.delegate = self
        map.showsUserLocation = true
        table.delegate = self
        table.dataSource = self
        let location = CLLocation(latitude: -22.9068, longitude: -43.1729)
        let regionRadius: CLLocationDistance = 100000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
            map.setRegion(coordinateRegion, animated: true)
        }
                let location2 = CLLocation(latitude: -22.9767, longitude: -43.3946)
        centerMapOnLocation(location2)
        let ann=CustomAnnotation(coordinate: location2.coordinate, title: "Parque Olímpico",subtitle: "Barra Da Tijuca")
        self.map.addAnnotation(ann)
        let location3 = CLLocation(latitude: -22.8933, longitude: -43.2923)
        let ann2=CustomAnnotation(coordinate: location3.coordinate, title: "Estádio Olímpico",subtitle: "Engenhão")
        self.map.addAnnotation(ann2)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            map.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
        }
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        index = indexPath.row
        performSegueWithIdentifier("PontodeColetaToPontodeColetaUnico", sender: self)
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.table.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        cell.name.text = places[indexPath.row].title
       // cell.button = UIButton()
       // cell.distance =
        cell.imagePlace.image = places[indexPath.row].image
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let viewController: PontodeColetaUnicoViewController = segue.destinationViewController as? PontodeColetaUnicoViewController {
            viewController.index = index
        }

    }

}
