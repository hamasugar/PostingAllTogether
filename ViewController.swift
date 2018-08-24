////
////  ViewController.swift
////  ikkatuPost
////
////  Created by user on 2018/08/23.
////  Copyright © 2018年 hamasugartanaka. All rights reserved.
////
//
import UIKit
import Photos
import Foundation


class ViewController: UIViewController,StreamDelegate {



    let image = UIImage(named:"womanpicture")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var button: UIButton!



    @IBAction func button(_ sender: Any){

//       var text1 = "aaaa"
//        var text2 = text1.data(using: String.Encoding.utf8)
//
//        let url: NSURL = NSURL(string: "http://")!
//        var request = NSMutableURLRequest(url: url as URL)
//        request.httpMethod = "POST"
//        request.httpBody = text2
//
//        var data = Data()
//        var dic = NSDictionary()
//
//        do {
//             data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: nil)
//        } catch {
//            // エラー処理
//        }
//
//
//        do {
//
//            dic = JSONSerialization.JSONObjectWithData(data, options:nil) as NSDictionary
//
//        } catch {
            // エラー処理
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        



//        var picture:Data = UIImageJPEGRepresentation(image!, 1.0) as! Data
//      let boundary = "----WebKitFormBoundaryZLdHZy8HNaBmUX0d"
//
//
//
        
        let postString = "aaaaaaaaaaaa"
        var request = URLRequest(url: URL(string: "http://52.198.189.199:80/get_tags")!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        request.setValue("plan/text", forHTTPHeaderField: "Content-Type")


        request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")



        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in

            if error != nil {
                print(error)
                return
            }

            if data != nil{


                print (String.init(data: data!, encoding: String.Encoding.utf8))
            }



        })
        task.resume()




//        let string = "aaaaaa"
//
//
//
//
//        var readStream : Unmanaged<CFReadStream>?
//        var writeStream: Unmanaged<CFWriteStream>?
//
//        CFStreamCreatePairWithSocketToHost(nil, self.ServerAddress, self.serverPort, &readStream, &writeStream)
//
//        self.inputStream  = readStream!.takeRetainedValue()
//        self.outputStream = writeStream!.takeRetainedValue()
//
//        self.inputStream.delegate  = self
//        self.outputStream.delegate = self
//
//        self.inputStream.schedule(in: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
//        self.outputStream.schedule(in: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
//
//        self.inputStream.open()
//        self.outputStream.open()
//
//         print("connect success!!")
//
//        var ccommand = string.data(using: String.Encoding.utf8, allowLossyConversion: false)!
//        let text = ccommand.withUnsafeMutableBytes{ bytes in return String(bytesNoCopy: bytes, length: ccommand.count, encoding: String.Encoding.utf8, freeWhenDone: false)!}
//        self.outputStream.write(UnsafePointer(text), maxLength: text.utf8.count)
//
//
//
//
//


        }


//    var inputStream : InputStream!
//    var outputStream: OutputStream!
//    let ServerAddress: CFString =  NSString(string: "52.198.189.199") //IPアドレスを指定
//    let serverPort: UInt32 = 80  //開放するポートを指定
//
//
//




    }







