//
//  NearbyAnnotationCalloutPopoverViewController.swift
//  Plum
//
//  Created by 大畅 on 2016/12/14.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NearbyAnnotationCalloutPopoverViewController: UIViewController {

    @IBOutlet weak var annotationName: UILabel!
    
    var annotationNameString : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        annotationName.text = annotationNameString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func callButtonPressed(_ sender: Any) {
        if let url = URL(string:"tel://\(6468818484)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }

    @IBAction func directionButtonPressed(_ sender: Any) {
        let startLocation = CLLocationCoordinate2D(latitude: 51.50722, longitude: -0.12750)
        let startPlacemark = MKPlacemark(coordinate: startLocation, addressDictionary: nil)
        let start = MKMapItem(placemark: startPlacemark)
        let destinationLocation = CLLocationCoordinate2D(latitude: 51.5149001, longitude: -0.1118255)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        let destination = MKMapItem(placemark: destinationPlacemark)
        let options = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeTransit]
        MKMapItem.openMaps(with: [start, destination], launchOptions: options)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
