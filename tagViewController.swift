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
    
   
    @IBOutlet weak var tagButton1: UIButton!
    
    @IBOutlet weak var tagButton2: UIButton!
    
    @IBOutlet weak var tagButton3: UIButton!
    
    
    @IBAction func tagButton1(_ sender: Any) {
        
        
        if self.tagButton1.backgroundColor == UIColor.red{
            
            tagButton1.backgroundColor = UIColor.brown
            
        }
        else{
            tagButton1.backgroundColor = UIColor.red
        }
        
        
        
        
    }
    
    @IBAction func tagButton2(_ sender: Any) {
        
        if self.tagButton2.backgroundColor == UIColor.red{
            
            tagButton2.backgroundColor = UIColor.brown
            
        }
        else{
            tagButton2.backgroundColor = UIColor.red
        }
        
    }
    
    
    @IBAction func tagButton3(_ sender: Any) {
        
        if self.tagButton3.backgroundColor == UIColor.red{
            
            tagButton3.backgroundColor = UIColor.brown
            
        }
        else{
            tagButton3.backgroundColor = UIColor.red
        }
        
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("fffffffffffffffffffffffffffff")
        sampleImage.contentMode = .scaleAspectFit
        sampleImage.image = image2
        
        self.tagButton1.layer.masksToBounds = true
        self.tagButton1.layer.cornerRadius = 15.0
        self.tagButton1.backgroundColor = UIColor.red
        
        self.tagButton2.layer.masksToBounds = true
        self.tagButton2.layer.cornerRadius = 15.0
        self.tagButton2.backgroundColor = UIColor.red
        
        self.tagButton3.layer.masksToBounds = true
        self.tagButton3.layer.cornerRadius = 15.0
        self.tagButton3.backgroundColor = UIColor.red
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goSubmitButton(_ sender: Any) {
        
        
        if self.tagButton1.backgroundColor == UIColor.red{
             UserDefaults.standard.set(UserDefaults.standard.object(forKey: "tag1") as! String, forKey: "tag1")
            }
        else{
            UserDefaults.standard.set("", forKey: "tag1")
        }
        
        if self.tagButton2.backgroundColor == UIColor.red{
            UserDefaults.standard.set(UserDefaults.standard.object(forKey: "tag2") as! String, forKey: "tag2")
        }
        else{
            UserDefaults.standard.set("", forKey: "tag2")
        }
        
        
        if self.tagButton3.backgroundColor == UIColor.red{
            UserDefaults.standard.set(UserDefaults.standard.object(forKey: "tag3") as! String, forKey: "tag3")
        }
        else{
            UserDefaults.standard.set("", forKey: "tag3")
        }
        
        var postString = ""
        
        if self.tagButton1.backgroundColor == UIColor.red{
            
            postString += "\(tag1.text!)"
        }
        
        if self.tagButton2.backgroundColor == UIColor.red{
            
            postString += "_\(tag2.text!)"
        }
        
        if self.tagButton3.backgroundColor == UIColor.red{
            
            postString += "_\(tag3.text!)"
        }
        
        if postString.prefix(1) == "_"{
            
            print ("llllllllllllllll")
            postString = "\(String(postString[postString.index(after: postString.startIndex)..<postString.endIndex]))"
            
        }
        
        print (postString)
        print ("yyyyyyyyyyyyyyyyyyy")
        var request = URLRequest(url: URL(string: "http://52.198.189.199:80/tags")!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        request.setValue("plain/text", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            
            
        })
        task.resume()
        
        print ("jjjjjjjjjjjjj")
        
        
        
        
        
        
        
        
        
        performSegue(withIdentifier: "goSubmit", sender: nil)
        
    }
    
    
    @IBAction func getTag(_ sender: Any) {
        
        sleep(3)
        
        self.tag1.text = UserDefaults.standard.object(forKey: "tag1") as! String
        self.tag2.text = UserDefaults.standard.object(forKey: "tag2") as! String
        self.tag3.text = UserDefaults.standard.object(forKey: "tag3") as! String
        
    
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goSubmit"{
        
        let nextVC:SubmitViewController = segue.destination as! SubmitViewController
        
        nextVC.image = self.image2
            
        }
        
        if segue.identifier == "goEdit"{
            
            let nextVC:editViewController = segue.destination as! editViewController
            
            nextVC.image = self.image2
            
            
        }
        
        
    }
    
    
    
    @IBAction func goEditButton(_ sender: Any) {
        
        
        
        performSegue(withIdentifier: "goEdit", sender: nil)
        
        
        
        
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
