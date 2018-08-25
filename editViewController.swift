//
//  editViewController.swift
//  ikkatuPost
//
//  Created by user on 2018/08/24.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit

class editViewController: UIViewController {
    
    
    var image:UIImage!   // 編集する前の画像
    var imageView = UIImageView()
    var screenShot = UIImage() // 編集した後の画像はスクリーンショットを取ることで保存する
    // デフォルトの色は赤にする
    var color:String = "red"
    
    
    // 丸いボタンを押された時に色をかえる
    @IBAction func redButton(_ sender: Any) {
        color = "red"
    }
    
    
    
    
    @IBAction func pinkButton(_ sender: Any) {
        
        
        color = "pink"
    }
    
    @IBAction func yellowButton(_ sender: Any) {
        color = "yellow"
    }
    
    
    @IBAction func greenButton(_ sender: Any) {
        
        color = "green"
    }
    
    
    @IBAction func blueButton(_ sender: Any) {
        
        color = "blue"
    }
    
    
    
    var x1:CGFloat = -1
    var y1:CGFloat = -1
    var x2:CGFloat = -1
    var y2:CGFloat = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // 画面の上半分に画像を表示させる
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        imageView.image = image
        
        self.view.addSubview(imageView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // この関数によって一度画面から指を離しても次に触る時に異変が起こらない
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let atouch = touches.first as! UITouch
        let location = atouch.location(in: self.view)
        
        x1 = location.x
        x2 = location.x
        y1 = location.y
        y2 = location.y
    }

    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        //   x1,y1が描く線の始点　x2,y2が終点の座標になる　前に終点を次の始点にすることで連続した線を描ける
            x1 = x2
            y1 = y2
            
            let aTouch = touches.first as! UITouch
            let location = aTouch.location(in: self.view)
            
            // locationという変数から座標を読み取る
            x2 = location.x
            y2 = location.y
            
            //以下は最後まで線を描くための定型文
            let shapeLayer = CAShapeLayer()
            let path = UIBezierPath()
            path.move(to: CGPoint(x: x1, y: y1))
            path.addLine(to: CGPoint(x: x2, y: y2))
            path.lineWidth = CGFloat(5.0) // 線の太さ
            shapeLayer.lineWidth = 5.0 // 不要かもしれない
        
        if color == "red"{
            shapeLayer.strokeColor = UIColor.red.cgColor
        }
        if color == "yellow"{
            shapeLayer.strokeColor = UIColor.yellow.cgColor
        }
        if color == "green"{
            shapeLayer.strokeColor = UIColor.green.cgColor
        }
        if color == "blue"{
            shapeLayer.strokeColor = UIColor.blue.cgColor
        }
        
        if color == "pink"{
            // デフォルトにない色はrgbを指定して色を定義する
            let pinkColor = UIColor(red: 1, green: 0.2, blue: 0.8, alpha: 1.0)
            shapeLayer.strokeColor = pinkColor.cgColor
            
        }
        
        shapeLayer.path = path.cgPath
            
        self.view.layer.addSublayer(shapeLayer)
            
}
    
    
    @IBAction func finishEdit(_ sender: Any) {
        
        
        // 編集完了時に画面の上側のスクショをとって次の画面へ渡す　次の１行で写真の大きさと場所を指定する
    let rect:CGRect = CGRect(x:0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
    let context = UIGraphicsGetCurrentContext()
        
    let aa:CGAffineTransform = CGAffineTransform(translationX:0,y:0)
    context!.concatenate(aa)
        
        
    view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
    screenShot = UIGraphicsGetImageFromCurrentImageContext()!
        
    
    UIGraphicsEndImageContext()  // ここまでは定型文
        
    performSegue(withIdentifier: "backToTag", sender: nil)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC:tagViewController = segue.destination as! tagViewController
        nextVC.image2 = self.screenShot
        
}
    
    
}
