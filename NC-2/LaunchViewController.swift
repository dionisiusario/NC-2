//
//  LaunchViewController.swift
//  NC-2
//
//  Created by Dionisius Ario Nugroho on 18/09/19.
//  Copyright © 2019 Dionisius Ario Nugroho. All rights reserved.
//

import UIKit
import LocalAuthentication
import CoreLocation


class LaunchViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var warnLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    var locationManager : CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        warnLabel.isHidden = true
    self.locationManager.requestAlwaysAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        nextButton.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
   view1.layer.cornerRadius = 75
        view2.layer.cornerRadius = 75
        view3.layer.cornerRadius = 75
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let name = UserDefaults.standard.string(forKey: "name") ?? ""
        
        if name != "" {
            //faceID()
            self.performSegue(withIdentifier: "withName", sender: self)
        }
        else
        {
            
            self.performSegue(withIdentifier: "noName", sender: self)
            
        }
    }
    func faceID(){
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "to make sure "){(wasSuccesful, error) in
                if wasSuccesful{
                    self.performSegue(withIdentifier: "withName", sender: self)
                }else {
                    Alert.showBasic(title: "Incorrect credentials", msg: "NO! It's not you!", vc: self)
                }
                
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.authorizedAlways) {
            print("hiii")
            self.setUpGeofenceForAppleAcademy()
        }
    }
    
    func setUpGeofenceForAppleAcademy() {
        let geofenceRegionCenter = CLLocationCoordinate2DMake(-6.301849, 106.652562);
        let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter, radius: 100, identifier: "PlayaGrande");
        geofenceRegion.notifyOnExit = true;
        geofenceRegion.notifyOnEntry = true;
        self.locationManager.startMonitoring(for: geofenceRegion)
        print("hi")
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Welcome to Apple Developer Academy!")
        nextButton.isHidden = true
        warnLabel.isHidden = false
        
        //Good place to schedule a local notification
    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("See you later!")
        
        nextButton.isHidden = false
        warnLabel.isHidden = true
        //Good place to schedule a local notification
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
