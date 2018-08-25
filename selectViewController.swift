import UIKit
import Alamofire


class selectViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,URLSessionDelegate  {

    var cameraView:UIImageView!
    
    // cameraViewの上に画像を貼り付ける
    var image:UIImage!
    
    
    // 3つのタグを保持する文字列　前画面から値を受け取る
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
        
    //カメラは反応しない
        }
    
    
    @IBOutlet weak var willDicededImage: UIImageView!
    
    
    @IBAction func album(_ sender: Any) {
        
        // 下の四行のコードでアルバム選択画面へ移動する
        let pickerView = UIImagePickerController()

        pickerView.sourceType = .photoLibrary
        
        pickerView.delegate = self
    
        self.present(pickerView, animated: true)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 選択した写真を取得する
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
        // 画面に選んだ写真を表示させる
        self.willDicededImage.image = image
       
}
    
    
    @IBOutlet weak var selectButton: UIButton!
    
    
    @IBAction func selectButton(_ sender: Any) {
        
        
        var postString = "0"
        
        // 写真の横幅によって画像を区別して数字をサーバーへ送る
        if image.size.width == 4288.0 {
            
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
        
        
    // サーバーへ文章を送る定型文 plaintextの指定を忘れない
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
             
            }

            
            
            })
        task.resume()
        
        
        
       // 次のタグ選択画面へ移動
        
        performSegue(withIdentifier: "goTag", sender: nil)
        
    }
    
    // performSegueの関数が呼ばれる直前に呼ばれる関数　ここでタグのテキストと画像を受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
   
        let nextVC:tagViewController = segue.destination as! tagViewController
        
        nextVC.image2 = self.image
        nextVC.tagText1 = self.tag1
        nextVC.tagText2 = self.tag2
        nextVC.tagText3 = self.tag3
        
        
    }
    
}
