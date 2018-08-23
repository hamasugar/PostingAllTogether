//
//  loginViewController.swift
//  ikkatuPost
//
//  Created by user on 2018/08/23.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        touroku.layer.masksToBounds = true
        touroku.layer.cornerRadius = 10.0
        
        login.layer.masksToBounds = true
        login.layer.cornerRadius = 10.0
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    @IBAction func touroku(_ sender: Any) {
        
        
        
        UIView.animate(withDuration: 0.1,
                       
                       // アニメーション中の処理.
            animations: { () -> Void in
                
                // 拡大用アフィン行列を作成する.
                self.touroku.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
                
                // 縮小用アフィン行列を作成する.
                self.touroku.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                
                
        })
        
        performSegue(withIdentifier:"goHome", sender: nil)
        
        
    }
    
    
    @IBAction func tourokuDown(_ sender: Any) {
        
        
        UIView.animate(withDuration: 0.06,
                       
                       // アニメーション中の処理.
            animations: { () -> Void in
                
                // 縮小用アフィン行列を作成する.
                self.touroku.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                
        })
        
        
        
        
        
    }
    
    
    
    
    
    @IBAction func login(_ sender: Any) {
        
        
        
        if (password.text?.count)!<=7{
            
            let alertcon = UIAlertController(title: "パスワードが違います", message:"パスワードが違います", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style:.default, handler: nil)
            alertcon.addAction(action)
            present(alertcon, animated: true, completion: nil)
            
            
        }
        else{
            
           performSegue(withIdentifier:"goHome", sender: nil)
        }
        
        
        
       
        
    }
    
    @IBOutlet weak var touroku: UIButton!
    
    
    @IBOutlet weak var login: UIButton!
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
