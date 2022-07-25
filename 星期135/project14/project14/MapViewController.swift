//
//  MapViewController.swift
//  project14
//
//  Created by 徐國堂 on 2022/7/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var city:City!
    var bottomSafeArea: CGFloat!
    var moveHeight:CGFloat!
    @IBOutlet var mapView:MKMapView!
    
    @IBOutlet var containerView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.city
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var bottomSafeArea: CGFloat!

        if #available(iOS 11.0, *) {
            bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            bottomSafeArea = bottomLayoutGuide.length
        }

        moveHeight = containerView.bounds.height + 44 + bottomSafeArea + 10
        containerView.transform = CGAffineTransform(translationX: 0, y: moveHeight)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goPart"{
            let partViewController = segue.destination as! PartViewController
            partViewController.delegate = self;
        }
    }
    
    @IBAction func popView(_ sender:UIBarButtonItem){
        UIView.animate(withDuration: 0.5){
            self.containerView.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func goBack(_ sender:UIBarButtonItem){
        dismiss(animated: true)
        UIView.animate(withDuration: 0.5){
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.moveHeight)
        }
    }
    
    
}

extension MapViewController:PartViewControllerDelegate{
    func popDown(){
        UIView.animate(withDuration: 0.5){
            self.containerView.transform = CGAffineTransform(translationX: 0, y: self.moveHeight)
        }
    }
}
