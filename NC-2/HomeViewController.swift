//
//  HomeViewController.swift
//  NC-2
//
//  Created by Dionisius Ario Nugroho on 19/09/19.
//  Copyright © 2019 Dionisius Ario Nugroho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var reflectionCollectionView: UICollectionView!
    
  //  @IBOutlet weak var title: UILabel!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var reflections: [Reflection]!
    
    @IBOutlet weak var names: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.fetchData()
        // Do any additional setup after loading the view.
        let name = UserDefaults.standard.string(forKey: "name") ?? ""
        DispatchQueue.main.async {
            self.names.text = name
            
        }
        
        
       fetchData()
    }
    func fetchData() {
        guard let managedContext = self.appDelegate?.persistentContainer.viewContext else { return }

        do {
            reflections = try managedContext.fetch(Reflection.fetchRequest())
//            print(reflections)
//            print(reflections.count)
//            reloadData()
        
        } catch let error {
            print("error fetch", error)
        }
    }
    
//    func reloadData() {
//        var indexPath: [NSIndexPath] = [NSIndexPath]()
//        indexPath.append(NSIndexPath(item: 0, section: 0))
//        indexPath.append(NSIndexPath(item: 1, section: 0))
//        indexPath.append(NSIndexPath(item: 2, section: 0))
//
//        reflectionCollectionView.reloadItems(at: indexPath as [IndexPath])
//    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reflections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ReflectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReflectionCell
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MMM dd, yyyy"
        
        let dt = dateFormat.string(from: reflections[indexPath.row].date!) as? String
    
        cell.refTitle.text = reflections[indexPath.row].title
        cell.refDetail.text = reflections[indexPath.row].detail
        cell.refImage.image = UIImage(named: reflections[indexPath.row].mood!)
        cell.refDate.text = dt
    //menampilksn datenya juga dong
       
            
        if cell.refImage.image == UIImage(named: "angry"){
            cell.contentView.backgroundColor = UIColor(red: 0.94, green: 0.68, blue: 0.67, alpha: 1.00)
        } else
        if cell.refImage.image == UIImage(named: "sad"){
                cell.contentView.backgroundColor = UIColor(red: 0.67, green: 0.79, blue: 0.94, alpha: 1.00)
        } else
        if cell.refImage.image == UIImage(named: "bored"){
                cell.contentView.backgroundColor = UIColor(red: 0.94, green: 0.82, blue: 0.67, alpha: 1.00)
        } else
        if cell.refImage.image == UIImage(named: "happy"){
            cell.contentView.backgroundColor = UIColor(red: 1.0, green: 0.60, blue: 0.20, alpha: 1.00)
        }
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        return cell
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
