//
//  FillReflectionViewController.swift
//  NC-2
//
//  Created by Dionisius Ario Nugroho on 19/09/19.
//  Copyright © 2019 Dionisius Ario Nugroho. All rights reserved.
//

import UIKit

class FillReflectionViewController: UIViewController {
    
    @IBOutlet weak var boostWord: UILabel!
    @IBOutlet weak var questionWord: UILabel!
    @IBOutlet weak var refTitleFill: UITextField!
    @IBOutlet weak var detailReflectionFill: UITextView!
    
    @IBOutlet weak var DoneButton: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var moodVerification:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if moodVerification == "happy"{
            boostWord.text = "I'm happy to hear that"
            questionWord.text = "Why you feel so happy?"
        }
        if moodVerification == "sad"{
            boostWord.text = "Everything will gonna be alright! "
            questionWord.text = "What things that make you feel so blue?"
        }
        if moodVerification == "angry"{
            boostWord.text = "Don't make anger control yourself!"
            questionWord.text = "What's going on?"
        }
        if moodVerification == "bored"{
            boostWord.text = "It's normal to get bored.."
            questionWord.text = "do you have something to tell me?"
        }
        
    }
    
        func saveData() {
            guard let managedContext = self.appDelegate?.persistentContainer.viewContext else { return }
    
            //let reflection = Reflection(context: managedContext)
            let reflection = Reflection(context: managedContext)
            
            reflection.title = refTitleFill.text!
            reflection.detail = detailReflectionFill.text!
            reflection.mood = moodVerification
            reflection.date = Date()
    
            do {  
                try managedContext.save()
            } catch let error {
                print("save error :", error)
            }
        }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        saveData()
        self.performSegue(withIdentifier: "backToHome", sender: self)
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
