//
//  IdentityViewController.swift
//  NC-2
//
//  Created by Dionisius Ario Nugroho on 19/09/19.
//  Copyright © 2019 Dionisius Ario Nugroho. All rights reserved.
//

import UIKit
import LocalAuthentication

class IdentityViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var sessionPicker: UIPickerView!
 
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    let session = ["Morning (09.00-13.00)", "Afternoon (14.00-18.00)"]
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        <#code#>
//    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()
        
        
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = session[row]
        return label
    }
    var names: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       view1.layer.cornerRadius = 75
        view2.layer.cornerRadius = 75
        view3.layer.cornerRadius = 75
    }
    
    
    
    @IBAction func saveNameSessionData(_ sender: Any) {
        names = nameTxtField.text!
        UserDefaults.standard.set(names, forKey: "name")
        //faceID()
        self.performSegue(withIdentifier: "goToHome", sender: self)
        
    }
//    func faceID(){
//         let context = LAContext()
//
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "to make sure "){(wasSuccesful, error) in
//                if wasSuccesful{
//                 self.performSegue(withIdentifier: "goToHome", sender: self)
//                }else {
//                    Alert.showBasic(title: "Incorrect credentials", msg: "NO! It's not you!", vc: self)
//                }
//
//        }
//
//    }
//    }
    
    
        
    

//    func saveData() {
//        guard let managedContext = self.appDelegate?.persistentContainer.viewContext else { return }
//
//        let reflection = Reflection(context: managedContext)
//
//        reflection.name = nameTxtField.text!
//        reflection.session = sessionPicker.dataSource as? String
//
//        do {
//            try managedContext.save()
//        } catch let error {
//            print("save error :", error)
//        }
//    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return session[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return session.count
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
class Alert {
    class func showBasic(title: String, msg: String, vc: UIViewController){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction( title:"Ok", style:.default, handler: nil))
        vc.present(alert, animated: true)
    }
}
