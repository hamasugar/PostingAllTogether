import UIKit

class loginViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var touroku: UIButton!
    @IBOutlet weak var login: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ボタンに少し丸みをつけている
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
        // ボタンが押されるとボタンを伸縮させる　パスワードに関係なく次の画面へ移る
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
        // パスワードが７文字以下だと問答無用でパスワードが違うことにする
        if (password.text?.count)!<=7{
            
            let alertcon = UIAlertController(title: "パスワードが違います", message:"パスワードが違います", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style:.default, handler: nil)
            alertcon.addAction(action)
            present(alertcon, animated: true, completion: nil)
            
            }
        else{
            // ボタンをぷよぷよさせる
            UIView.animate(withDuration: 0.1,
                           
        // アニメーション中の処理.
                animations: { () -> Void in
                    
                    // 拡大用アフィン行列を作成する.
            self.login.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
                    
                    // 縮小用アフィン行列を作成する.
            self.login.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    
                    
                    
            })
            
            performSegue(withIdentifier:"goHome", sender: nil)
        }
        

    }
    
    // 画面のどこかが押された時にキーボードが閉じられる
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)}
    
    
}
