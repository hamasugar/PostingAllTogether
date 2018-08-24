//
//  selectViewController.swift
//  ikkatuPost
//
//  Created by user on 2018/08/23.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit
import Alamofire


class selectViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,URLSessionDelegate  {

    var cameraView:UIImageView!
    
    var image:UIImage!
    
    var tag1:String!
    var tag2:String!
    var tag3:String!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func camera(_ sender: Any) {
        
        let pickerController = UIImagePickerController()
        let sourceType:UIImagePickerControllerSourceType =
            UIImagePickerControllerSourceType.camera
        
        //ソースタイプを指定(cameraの場合はplistでカメラ使用を許可すること)
        pickerController.sourceType = sourceType
        pickerController.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        //カメラを表示
        present(pickerController, animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    @IBOutlet weak var willDicededImage: UIImageView!
    
    
    
    
    
    
    
    
    
    
    @IBAction func album(_ sender: Any) {
        
        
        let pickerView = UIImagePickerController()

        pickerView.sourceType = .photoLibrary
        // デリゲート
        pickerView.delegate = self
        // ビューに表示
        self.present(pickerView, animated: true)
        
        
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 選択した写真を取得する
        print ("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        print ("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
        
        self.willDicededImage.image = image
       
        
       
    }
    
    
    @IBOutlet weak var selectButton: UIButton!
    
    
    @IBAction func selectButton(_ sender: Any) {
        
        
//        let myCofig:URLSessionConfiguration = URLSessionConfiguration.default
//
//        let myUrl2:NSURL = NSURL(string: "http://52.198.189.199:80/picture")!
//
//        let myRequest2:NSMutableURLRequest = NSMutableURLRequest(url: myUrl2 as URL)
//        myRequest2.httpMethod = "POST"
//
//        let mySession:URLSession = URLSession(configuration: myCofig, delegate: self, delegateQueue: OperationQueue.main)
//
//        // 画像データを読み出し、Data型に変換する.
//        let myfile:NSData = UIImageJPEGRepresentation(self.image!, 0.5)! as NSData
//
//        // アップロード用のタスクを生成.
//        let myTask:URLSessionUploadTask = mySession.uploadTask(with: myRequest2 as URLRequest, from: myfile as Data)
//
//        // タスクの実行.
//        myTask.resume()
        
        
        
        
        var postString = "0"
        
        
        if image.size.width == 259.0 {
            
            postString = "1"
            
        }
        if image.size.width == 318.0{
            
            postString = "2"
            
        }
        if image.size.width == 327.0{
            
            postString = "3"
            
        }
        if image.size.width == 306.0{
            
            postString = "4"
            
        }
        if image.size.width == 275.0{
            
            postString = "5"
            
        }
        
        
        
        var request = URLRequest(url: URL(string: "http://52.198.189.199:80/get_tags")!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        request.setValue("plain/text", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
            
            if data != nil{
                
                
            let threetags = String.init(data: data!, encoding: String.Encoding.utf8)!
            self.tag1 = threetags.components(separatedBy: "_")[0]
                self.tag2 = threetags.components(separatedBy: "_")[1]
            self.tag3 = threetags.components(separatedBy: "_")[2]
             
                
                print (self.tag1)
                 print (self.tag2)
                 print (self.tag3)
                print ("-------------------------------")
                
                UserDefaults.standard.set(self.tag1, forKey: "tag1")
                UserDefaults.standard.set(self.tag2, forKey: "tag2")
                UserDefaults.standard.set(self.tag3, forKey: "tag3")
               
            
            }

            
            
            })
        task.resume()
        
        
        
        
        
        
        performSegue(withIdentifier: "goTag", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC:tagViewController = segue.destination as! tagViewController
        
        nextVC.image2 = self.image
        
        
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
