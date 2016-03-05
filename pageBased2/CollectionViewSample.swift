

import UIKit
extension NSMutableData {
    func appendString(string: String) {
        let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        appendData(data!)
    }
}
class CollectionViewSample: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func uploadAFNetworkingButton(sender: AnyObject) {
        let camera = UIImagePickerControllerSourceType.PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(camera) {
            
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self
            self.presentViewController(picker, animated: true, completion: nil)
        }
        
    }
    @IBAction func uploadButton(sender: AnyObject) {
        let camera = UIImagePickerControllerSourceType.PhotoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(camera) {
            
            let picker = UIImagePickerController()
            picker.sourceType = camera
            picker.delegate = self
            self.presentViewController(picker, animated: true, completion: nil)
        }
    }
//    @IBOutlet weak var imageView: UIImageView!
//    @IBAction func launchCamera(sender: UIBarButtonItem) {
//        let camera = UIImagePickerControllerSourceType.PhotoLibrary
//        
//        if UIImagePickerController.isSourceTypeAvailable(camera) {
//            
//            let picker = UIImagePickerController()
//            picker.sourceType = camera
//            picker.delegate = self
//            self.presentViewController(picker, animated: true, completion: nil)
//        }
//    }
    var imageForUpload = UIImageView()
    //    var imageForUpload: UIImageView!
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if info[UIImagePickerControllerOriginalImage] != nil {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            //iamgeForUploadというUIImageを用意しておいてそこに一旦預ける
            self.imageForUpload.image = image
            self.AFNetworkingUploadRequest()
//            self.myImageUploadRequest()
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func AFNetworkingUploadRequest() {
//        let url = "http://dsh4k2h4k2.esy.es/uploadTest2.php"
        let url = "http://test.localhost/uploadTest4.php"
        let parameters: Dictionary<String,AnyObject> = ["userId": "12345"] // 画像以外に送りたいパラメータ
        let images: Dictionary<String,UIImage> = ["file": self.imageForUpload.image!] // 画像データ
        
        // Basic認証の情報
        let user = "user"
        let pass = "pass"
        
        let manager: AFHTTPSessionManager = AFHTTPSessionManager()
//        manager.requestSerializer.setAuthorizationHeaderFieldWithUsername(user, password: pass)
        manager.responseSerializer = AFHTTPResponseSerializer()

        manager.POST(url, parameters: parameters, constructingBodyWithBlock: { (data) in
            // 画像データを追加
            // htmlの<input type="file" ・・・>の部分
            for (key, value) in images
            {
                let name = key
                let imageData = NSData(data: UIImageJPEGRepresentation(value, 1)!)
                data.appendPartWithFileData(imageData, name: name, fileName: name, mimeType: "image/jpeg")
            }
            }, success: { (operation: NSURLSessionDataTask!, responsobject:AnyObject!) in
                // アップロード成功時の処理
                print("アップロード成功")
                print(operation)
                print(responsobject)
            }, failure: { (operation, error) in
                // アップロード失敗時の処理
                print("アップロード失敗")
                print(error)
        })
        
    }
    //画像のアップロード処理
    func myImageUploadRequest(){
        //myUrlには自分で用意したphpファイルのアドレスを入れる
        let myUrl = NSURL(string:"http://test.localhost/uploadTest4.php")
//        let myUrl = NSURL(string:"http://dsh4k2h4k2.esy.es/uploadTest4.php")
        let request = NSMutableURLRequest(URL:myUrl!)
        request.HTTPMethod = "POST"
        //下記のパラメータはあくまでもPOSTの例
        let param = [
            "userId" : "12345"
        ]
        let boundary = generateBoundaryString()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        let imageData = UIImageJPEGRepresentation(self.imageForUpload.image!, 1)
        if(imageData==nil) { return; }
        request.HTTPBody = createBodyWithParameters(param, filePathKey: "file", imageDataKey: imageData!, boundary: boundary)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                print("error=\(error)")
                return
            }
            // レスポンスを出力
            print("******* response = \(response)")
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("****** response data = \(responseString!)")
            dispatch_async(dispatch_get_main_queue(),{
                //アップロード完了
            });
        }
        task.resume()
        
    }
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        var body = NSMutableData()
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        let filename = "user-profile1.jpg"
        let mimetype = "image/jpg"
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimetype)\r\n\r\n")
        body.appendData(imageDataKey)
        body.appendString("\r\n")
        body.appendString("--\(boundary)--\r\n")
        return body
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().UUIDString)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        
//        if info[UIImagePickerControllerOriginalImage] != nil {
//            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//            //iamgeForUploadというUIImageを用意しておいてそこに一旦預ける
//            self.imageForUpload.image = image
//            self.AFNetworkingUploadRequest()
//        }
//        picker.dismissViewControllerAnimated(true, completion: nil)
//        
//    }
    
}


//class CollectionViewSample: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    var myCollectionView : UICollectionView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSizeMake(50, 50)//大きさ
//        layout.sectionInset = UIEdgeInsetsMake(16, 16, 32, 16)//マージン
//        layout.headerReferenceSize = CGSizeMake(100,30)
//        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        myCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellTest")
//        
//        myCollectionView.delegate = self
//        myCollectionView.dataSource = self
//        self.view.addSubview(myCollectionView)
//        
//    }
//    
//    //Cellがクリックされた時によばれます
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        print("選択しました: \(indexPath.row)")
//    }
//    
//    //Cellの合計数
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 50
//    }
//    
//    //Cellオブジェクトを返す。ここでカスタムセルにしたりするとそれぞれ変更できる。
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellTest", forIndexPath: indexPath) 
//        cell.backgroundColor = UIColor.redColor()
//        
//        //-----
//        //おまけ、Swiftサラリーマンのおっさんの顔
////        let url = NSURL(string:"http://swift-salaryman.com/files/image/page_top.gif");
////        var err: NSError?;
////        var imageData = NSData(contentsOfURL:url!,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!;
//        let img = UIImage(named: "smile.png")
////        var img = UIImage(data:imageData);
//        let iv = UIImageView(image:img);
//        iv.frame = CGRectMake(0, 0, 50, 50);
//        iv.backgroundColor = UIColor.greenColor();
//        cell.addSubview(iv);
//        //-----
//        
//        return cell
//    }

//}
    