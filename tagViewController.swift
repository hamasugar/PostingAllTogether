//
//  tagViewController.swift
//  ikkatuPost
//
//  Created by user on 2018/08/23.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit

class tagViewController: UIViewController {
    
    
    @IBOutlet weak var tag1: UILabel!
    
    @IBOutlet weak var tag2: UILabel!
    
    
    @IBOutlet weak var tag3: UILabel!
    
    @IBOutlet weak var sampleImage: UIImageView!
    
    var  image2:UIImage!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("fffffffffffffffffffffffffffff")
        sampleImage.contentMode = .scaleAspectFit
        sampleImage.image = image2
        
        print ("ggggggggggggggggggggggggggggggg")
//        self.sampleImage = UserDefaults.standard.object(forKey: "image") as! UIImageView

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goSubmitButton(_ sender: Any) {
        
        
        performSegue(withIdentifier: "goSubmit", sender: nil)
        
    }
    
    
    @IBAction func getTag(_ sender: Any) {
        
        
        
        self.tag1.text = "woman"
        self.tag2.text = "cute"
        self.tag3.text = "beautiful"
        
        let hash = "#"
        
        UserDefaults.standard.set(hash+"woman", forKey: "tag1")
         UserDefaults.standard.set(hash+"cute", forKey: "tag2")
         UserDefaults.standard.set(hash+"beautiful", forKey: "tag3")
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC:SubmitViewController = segue.destination as! SubmitViewController
        
        nextVC.image = self.image2
        
        
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
