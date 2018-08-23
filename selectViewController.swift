//
//  selectViewController.swift
//  ikkatuPost
//
//  Created by user on 2018/08/23.
//  Copyright © 2018年 hamasugartanaka. All rights reserved.
//

import UIKit

class selectViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    var cameraView:UIImageView!
    
    var image:UIImage!
    
    
    
    
    
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
        
        print ("ccccccccccccccccccccccccc")
        
        
       
        
        
        
        print ("ddddddddddddddddddddddddddddd")
        
       
        
       
    }
    
    
    @IBOutlet weak var selectButton: UIButton!
    
    
    @IBAction func selectButton(_ sender: Any) {
        
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
