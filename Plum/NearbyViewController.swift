//
//  NearbyViewController.swift
//  Plum
//
//  Created by 大畅 on 2016/11/17.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NearbyViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var nearbyMapView: MKMapView!
    let locationManager = CLLocationManager()
    
    var annotations : [MKPlacemark] = [MKPlacemark]()
    
    var locationHasBeenUpdated : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        nearbyMapView.delegate = self
        
        let request : MKLocalSearchRequest = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Health"
        request.region = nearbyMapView.region
        
        let localSearch : MKLocalSearch = MKLocalSearch(request: request)
        localSearch.start { response, error in
            guard let response = response else {
                print("There was an error searching for: \(request.naturalLanguageQuery) error: \(error)")
                return
            }
            
            for item in response.mapItems {
                let annotation : MKPlacemark = MKPlacemark(placemark: item.placemark)
                print(annotation)
                self.annotations.append(annotation)
            }
            
            self.nearbyMapView.addAnnotations(self.annotations)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if (!locationHasBeenUpdated) {
            let region = MKCoordinateRegionMakeWithDistance(
                userLocation.location!.coordinate, 5000, 5000)
            
            mapView.setRegion(region, animated: false)
            locationHasBeenUpdated = true
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        // Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = false
            annotationView.image = UIImage(named: "PinMark")
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        print(#function)
        
        var i = -1;
        for view in views {
            i += 1;
            if view.annotation is MKUserLocation {
                continue;
            }
            
            // Check if current annotation is inside visible map rect, else go to next one
            let point:MKMapPoint  =  MKMapPointForCoordinate(view.annotation!.coordinate);
            if (!MKMapRectContainsPoint(self.nearbyMapView.visibleMapRect, point)) {
                continue;
            }
            
            let endFrame:CGRect = view.frame;
            
            // Move annotation up
            view.frame = CGRect(origin: CGPoint(x: view.frame.origin.x,y :view.frame.origin.y - 60), size: CGSize(width: view.frame.size.width, height: view.frame.size.height))
            view.alpha = 0
            
            // Animate drop
            let delay = 0.03 * Double(i)
            UIView.animate(withDuration: 0.5, delay: delay, options: UIViewAnimationOptions.curveEaseInOut, animations:{() in
                view.frame = endFrame
                view.alpha = 1
                
            }, completion:{(Bool) in
                UIView.animate(withDuration: 0.05, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations:{() in
                    view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    
                }, completion: {(Bool) in
                    UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations:{() in
                        view.transform = CGAffineTransform.identity
                    }, completion: nil)
                })
                
            })
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Select")
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
