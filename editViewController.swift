//
//  editViewController.swift
//  ikkatuPost
//
//  Created by user on 2018/08/24.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit

class editViewController: UIViewController {
    
    var image:UIImage!
    var imageView = UIImageView()
    
    var x1:CGFloat = -1
    var y1:CGFloat = -1
    var x2:CGFloat = -1
    var y2:CGFloat = -1
    
    var screenShot = UIImage()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        imageView.image = image
        
        self.view.addSubview(imageView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let atouch = touches.first as! UITouch
        let location = atouch.location(in: self.view)
        
        x1 = location.x
        x2 = location.x
        y1 = location.y
        y2 = location.y
    }

    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
            
            x1 = x2
            y1 = y2
            
            let aTouch = touches.first as! UITouch
            let location = aTouch.location(in: self.view)
            
            
            x2 = location.x
            y2 = location.y
            
            
            let shapeLayer = CAShapeLayer()
            let path = UIBezierPath()
            path.move(to: CGPoint(x: x1, y: y1))
            path.addLine(to: CGPoint(x: x2, y: y2))
            path.lineWidth = CGFloat(5.0) // 線の太さ
            shapeLayer.lineWidth = 5.0
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeLayer.path = path.cgPath
            
            self.view.layer.addSublayer(shapeLayer)
            
        }
    
    
    @IBAction func finishEdit(_ sender: Any) {
        
        
                let rect:CGRect = CGRect(x:0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
    let context = UIGraphicsGetCurrentContext()
        
        let aa:CGAffineTransform = CGAffineTransform(translationX:0,y:0)
           context!.concatenate(aa)
        
        
            view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        
                //コンテキストから画像を取得する。
        screenShot = UIGraphicsGetImageFromCurrentImageContext()!
        
                //コンテキストを破棄する。
                UIGraphicsEndImageContext()
        
        
        
        
        
        
        
        
        performSegue(withIdentifier: "backToTag", sender: nil)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC:tagViewController = segue.destination as! tagViewController
        nextVC.image2 = self.screenShot
        
        
        
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
