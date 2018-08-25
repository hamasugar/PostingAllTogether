

import UIKit
import Social

class SubmitViewController: UIViewController,UITextViewDelegate {

    
    var image:UIImage!
    
    // 文字数を表示するためのラベル
    var countLabel = UILabel()
    
    // 投稿ボタンと戻るボタン
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var postButton: UIButton!
    
// 文章を入力する欄
    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.isEditable = true
        textView.delegate = self
        
        
         var tag1 = UserDefaults.standard.object(forKey: "tag1") as! String
         var tag2 = UserDefaults.standard.object(forKey: "tag2") as! String
         var tag3 = UserDefaults.standard.object(forKey: "tag3") as! String
        
        // ボタンを丸くしている
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 50.0
        
        postButton.layer.masksToBounds = true
        postButton.layer.cornerRadius = 50.0
        
        
        
        if tag1 != ""{
            tag1 = "#\(tag1)"
        }
        
        if tag2 != ""{
            tag2 = "#\(tag2)"
        }
        
        if tag3 != ""{
            tag3 = "#\(tag3)"
        }
        
        // 最初に文章にタグを入力しておく
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
    
// 入力した文字数が変わるたびに呼び出されるデレゲートメソッド　実質編集するたびに呼び出されて文字数の表示をかえる
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        countLabel.text = "現在\(self.textView.text.count)文字"
        print ("kkkkkkkkkkk")
        return true
    }
    
    
    
    @IBAction func submit(_ sender: Any) {
        // タグと文章を両方サーバーへあげる
        let postString = textView.text!
        var request = URLRequest(url: URL(string: "http://52.198.189.199:80/tweet")!)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        request.setValue("plain/text", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
                    (data, response, error) in
        
        })
        task.resume()

        let facebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
        
        facebook?.add(image)
        // クリップボードにテキストを保存する なぜかテキストを直接指定できない
        let pasteboard: UIPasteboard = UIPasteboard.general
        pasteboard.string = self.textView.text!
        
        
       self.present(facebook!,animated:true,completion:nil)
        
}
    
    
   
    
@IBAction func backToHome(_ sender: Any) {
        
        performSegue(withIdentifier: "backToHome", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

   

}
