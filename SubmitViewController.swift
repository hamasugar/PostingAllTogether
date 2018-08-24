//
//  SubmitViewController.swift
//  ikkatuPost
//
//  Created by user on 2018/08/23.
//  Copyright © 2018年 hamasugartanaka. All rights reserved


import UIKit
import Social

class SubmitViewController: UIViewController,UITextViewDelegate {

    
    var image:UIImage!
    var countLabel = UILabel()
    // 20 60 335 21
    
    
    
    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.isEditable = true
        textView.delegate = self
        
        
        
         var tag1 = UserDefaults.standard.object(forKey: "tag1") as! String
         var tag2 = UserDefaults.standard.object(forKey: "tag2") as! String
         var tag3 = UserDefaults.standard.object(forKey: "tag3") as! String
        
        if tag1 != ""{
            tag1 = "#\(tag1)"
        }
        
        if tag2 != ""{
            tag2 = "#\(tag2)"
        }
        
        if tag3 != ""{
            tag3 = "#\(tag3)"
        }
        
        
        
        
        
        self.textView.text = " \(tag1) \(tag2) \(tag3)"
        
        self.countLabel.frame = CGRect(x: 20, y: 60, width: 335, height: 21)
        
        self.countLabel.textAlignment = .center
        self.view.addSubview(countLabel)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        
        countLabel.text = "現在\(self.textView.text.count)文字"
        print ("kkkkkkkkkkk")
        return true
    }
    
    
    
    @IBAction func submit(_ sender: Any) {
        
        let postString = textView.text!
        var request = URLRequest(url: URL(string: "http://52.198.189.199:80/tweet")!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        request.setValue("plain/text", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
                    (data, response, error) in
        
        
        
        })
                task.resume()

        
//        LINE の実装を以下でやっています
//
//        let pasteBoard = UIPasteboard.general
//        pasteBoard.image = image
//
//        let lineSchemeImage: String = "line://msg/image/%@"
//        let scheme = String(format: lineSchemeImage, pasteBoard.name as CVarArg)
//        let messageURL: URL! = URL(string: scheme)
//
//        self.openURL(messageURL)
//
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
        facebook?.setInitialText(self.textView.text!)
        
        
      self.present(facebook!,animated:true,completion:nil)
        
        
        
        
        
        
}
    
    
   func openURL(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // 本来であれば、指定したURLで開けないときの実装を別途行う必要がある
            print("failed to open..")
        }
    }
    
    @IBAction func backToHome(_ sender: Any) {
        
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
