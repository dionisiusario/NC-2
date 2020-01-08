//
//  OnBoardingViewController.swift
//  NC-2
//
//  Created by Dionisius Ario Nugroho on 18/09/19.
//  Copyright © 2019 Dionisius Ario Nugroho. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    @IBOutlet weak var word1: UILabel!
    @IBOutlet weak var word2: UILabel!
    @IBOutlet weak var word3: UILabel!
    @IBOutlet weak var word4: UILabel!
    @IBOutlet weak var word5: UILabel!
    @IBOutlet weak var word6: UILabel!
    @IBOutlet weak var views: UIView!
    @IBOutlet weak var views2: UIView!
    @IBOutlet weak var sureButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2, delay: 0, animations: {
            self.word1.alpha = 1
        }){(isfinish) in
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.word2.alpha = 1
            }){(isfinish) in
                UIView.animate(withDuration: 1, delay: 0, animations: {
                    self.word3.alpha = 1
                }){(isfinish) in
                    UIView.animate(withDuration: 1, delay: 0, animations: {
                        self.word4.alpha = 1
                    }){(isfinish) in
                        UIView.animate(withDuration: 1, delay: 0, animations: {
                            self.word5.alpha = 1
                        }){(isfinish) in
                            UIView.animate(withDuration: 1, delay: 0, animations: {
                                self.word6.alpha = 1
                            }){(isfinish) in
                                UIView.animate(withDuration: 1, delay: 0, animations: {
                                    self.sureButton.alpha = 1
                                }){(isfinish) in
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        word1.alpha = 0
           word2.alpha = 0
           word3.alpha = 0
           word4.alpha = 0
           word5.alpha = 0
           word6.alpha = 0
        sureButton.alpha = 0
        
        views.layer.cornerRadius = 75
        views2.layer.cornerRadius = 75
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
