//
//  ViewController.swift
//  Map01_Data_Model_pList
//
//  Created by 김종현 on 2017. 9. 12..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        zoomToRegion()
        
        let a = PinPoint(coordinate: CLLocationCoordinate2D(latitude: 35.166197, longitude: 129.072594), title: "동의과학대학교", subtitle: "마지막 대학교")
        let b = PinPoint(coordinate: CLLocationCoordinate2D(latitude: 35.168444, longitude: 129.057832), title: "부산시민공원", subtitle: "김밥먹는 곳")
         let c = PinPoint(coordinate: CLLocationCoordinate2D(latitude: 35.164183, longitude: 129.064962), title: "송상현광장", subtitle: "부산 시민들의 휴식처")
        myMapView.addAnnotations([a,b,c])
        
        
        
        myMapView.delegate = self
    }
    
    func zoomToRegion() {
        //  DIT 위치정보 35.166197, 129.072594
        let center = CLLocationCoordinate2DMake(35.166197, 129.072594)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        
        myMapView.setRegion(region, animated: true)
        
    }

    // MKMapViewDelegate method
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MyPin"
        var  annotationView = myMapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            if annotation.title! == "부산시민공원" {
                annotationView?.pinTintColor = UIColor.green
                let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                leftIconView.image = UIImage(named:"aaa.jpg" )
                annotationView?.leftCalloutAccessoryView = leftIconView
            }else
            if annotation.title! == "동의과학대학교"{
                let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                leftIconView.image = UIImage(named:"bbb.jpeg" )
                annotationView?.leftCalloutAccessoryView = leftIconView
            }else
                if annotation.title! == "송상현 광장"{
                    let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                    leftIconView.image = UIImage(named:"ccc.jpg" )
                    annotationView?.leftCalloutAccessoryView = leftIconView
            }
            
            
        } else {
            annotationView?.annotation = annotation
        }
        
        //        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        //        leftIconView.image = UIImage(named:"aa.png" )
        //        annotationView?.leftCalloutAccessoryView = leftIconView
        
        let btn = UIButton(type: .detailDisclosure)
        annotationView?.rightCalloutAccessoryView = btn
        
        return annotationView
        
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        // print("callout Accessory Tapped!")
        
        let viewAnno = view.annotation
        let viewTitle: String = ((viewAnno?.title)!)!
        let viewSubTitle: String = ((viewAnno?.subtitle)!)!
        
        print("\(viewTitle) \(viewSubTitle)")
        
        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
        
        
    }
    
}
