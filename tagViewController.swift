
import UIKit

class tagViewController: UIViewController {
    

    // 3つのタグを表示するためのラベル
    
    @IBOutlet weak var tag1: UILabel!
    
    @IBOutlet weak var tag2: UILabel!
    
    
    @IBOutlet weak var tag3: UILabel!
    
    //選んだ画面を表示するための置き場所を定義する
    @IBOutlet weak var sampleImage: UIImageView!
    // 置き場所の上に貼り付ける画像イメージ
    var  image2:UIImage!
    
   // タグを入れるかを選択するための丸いボタンを定義する
    @IBOutlet weak var tagButton1: UIButton!
    
    @IBOutlet weak var tagButton2: UIButton!
    
    @IBOutlet weak var tagButton3: UIButton!
    
    
    var tagText1:String!
    var tagText2:String!
    var tagText3:String!
    
    
    // ボタンが赤ければ押されてた時黒くする　逆もまた然り　これを3回繰り返す
    @IBAction func tagButton1(_ sender: Any) {
        
        
        if self.tagButton1.backgroundColor == UIColor.red{
            
            tagButton1.backgroundColor = UIColor.brown
            
        }
        else{
            tagButton1.backgroundColor = UIColor.red
        }
        
        
        
        
    }
    
    @IBAction func tagButton2(_ sender: Any) {
        
        if self.tagButton2.backgroundColor == UIColor.red{
            
            tagButton2.backgroundColor = UIColor.brown
            
        }
        else{
            tagButton2.backgroundColor = UIColor.red
        }
        
    }
    
    
    @IBAction func tagButton3(_ sender: Any) {
        
        if self.tagButton3.backgroundColor == UIColor.red{
            
            tagButton3.backgroundColor = UIColor.brown
            
        }
        else{
            tagButton3.backgroundColor = UIColor.red
        }
        
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 縦横の表示形式を指定
        sampleImage.contentMode = .scaleAspectFit
        sampleImage.image = image2
        // ボタンを丸くする
        self.tagButton1.layer.masksToBounds = true
        self.tagButton1.layer.cornerRadius = 15.0
        self.tagButton1.backgroundColor = UIColor.red
        
        self.tagButton2.layer.masksToBounds = true
        self.tagButton2.layer.cornerRadius = 15.0
        self.tagButton2.backgroundColor = UIColor.red
        
        self.tagButton3.layer.masksToBounds = true
        self.tagButton3.layer.cornerRadius = 15.0
        self.tagButton3.backgroundColor = UIColor.red
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goEditButton(_ sender: Any) {
        // 編集画面へ移動
        performSegue(withIdentifier: "goEdit", sender: nil)
        
    }
    
    
    
    @IBAction func goSubmitButton(_ sender: Any) {
        
        
        var postString = ""
        // ボタンが赤ければ、そのボタンに対応するタグを文章へ加える
        if self.tagButton1.backgroundColor == UIColor.red{
             UserDefaults.standard.set(tagText1, forKey: "tag1")
             postString += "\(tag1.text!)"
            }
        else{
            UserDefaults.standard.set("", forKey: "tag1")
        }
        
        if self.tagButton2.backgroundColor == UIColor.red{
            UserDefaults.standard.set(tagText2, forKey: "tag2")
            postString += "_\(tag2.text!)"
            
        }
        else{
            UserDefaults.standard.set("", forKey: "tag2")
        }
        
        
        if self.tagButton3.backgroundColor == UIColor.red{
            UserDefaults.standard.set(tagText3, forKey: "tag3")
            postString += "_\(tag3.text!)"
        }
        else{
            UserDefaults.standard.set("", forKey: "tag3")
        }
        
        
        
    // _夕焼け_海のように最初がアンダーバーだった場合にアンダーバーを取り除く
        if postString.prefix(1) == "_"{
            
           postString = "\(String(postString[postString.index(after: postString.startIndex)..<postString.endIndex]))"
            
        }
        
        
        // 編集画面へ移動るる
    performSegue(withIdentifier: "goSubmit", sender: nil)
        
    }
    
    
    @IBAction func getTag(_ sender: Any) {
        
        // タグを表示する　タグの取得は前の画面で終わっている
        self.tag1.text = self.tagText1
        self.tag2.text = self.tagText2
        self.tag3.text = self.tagText3
        
}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 画面が遷移する前に呼ばれる　これによって画像が次の画面へ渡される
        if segue.identifier == "goSubmit"{
        
        let nextVC:SubmitViewController = segue.destination as! SubmitViewController
        
        nextVC.image = self.image2
            
        }
        
        if segue.identifier == "goEdit"{
            
            let nextVC:editViewController = segue.destination as! editViewController
            
            nextVC.image = self.image2
            
            
        }
        
        
    }
    
    
}
