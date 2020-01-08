//
//  MoodViewController.swift
//  NC-2
//
//  Created by Dionisius Ario Nugroho on 19/09/19.
//  Copyright © 2019 Dionisius Ario Nugroho. All rights reserved.
//

import UIKit

class MoodViewController: UIViewController {
    @IBOutlet weak var decoration: UIView!
    
    var moodVerif : String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decoration.layer.cornerRadius = 200
        // Do any additional setup after loading the view.
    
    }
    
    @IBAction func angryMoodTapped(_ sender: Any) {
  moodVerif = "angry"
        self.performSegue(withIdentifier: "fill", sender: self)
    }
    
    @IBAction func happyMoodTapped(_ sender: Any) {
    moodVerif = "happy"
        self.performSegue(withIdentifier: "fill", sender: self)
    }
  
    @IBAction func boredMoodTapped(_ sender: Any) {
    moodVerif = "bored"
        self.performSegue(withIdentifier: "fill", sender: self)
    }
    
    @IBAction func sadMoodTapped(_ sender: Any) {
        moodVerif = "sad"
        self.performSegue(withIdentifier: "fill", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FillReflectionViewController
        vc.moodVerification = moodVerif
//        self.performSegue(withIdentifier: "fill", sender: UIButton.self)
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
