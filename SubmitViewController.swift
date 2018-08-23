//
//  SubmitViewController.swift
//  ikkatuPost
//
//  Created by user on 2018/08/23.
//  Copyright © 2018年 hamasugartanaka. All rights reserved


import UIKit
import Social

class SubmitViewController: UIViewController {

    
    var image:UIImage!
    
    
    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.isEditable = true
        
        let tag1 = UserDefaults.standard.object(forKey: "tag1")
        let tag2 = UserDefaults.standard.object(forKey: "tag2")
        let tag3 = UserDefaults.standard.object(forKey: "tag3")
        
        
        self.textView.text = " \(tag1!) \(tag2!) \(tag3!)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submit(_ sender: Any) {
        
        
        let text = "今日もいい天気"
        
//        let rect:CGRect = CGRect(x:0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//
//
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
//
//
//        let context = UIGraphicsGetCurrentContext()
//
//
//        let aa:CGAffineTransform = CGAffineTransform(
//            translationX:0,y:0)
//
//        context!.concatenate(aa)
//
//
//        view.layer.render(in: UIGraphicsGetCurrentContext()!)
//
//
//        //コンテキストから画像を取得する。
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//
//        //コンテキストを破棄する。
//        UIGraphicsEndImageContext()

        
        
        let facebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        
        facebook?.add(image)
        facebook?.setInitialText(text)
        
        
        let twitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        
        
        twitter?.add(image)
        twitter?.setInitialText(text)
        
        self.present(twitter!,animated:true,completion:nil)
          
        self.present(facebook!,animated:true,completion:nil)
        
        
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
