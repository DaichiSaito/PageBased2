import UIKit

class CollectionViewSample: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var myCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(50, 50)//大きさ
        layout.sectionInset = UIEdgeInsetsMake(16, 16, 32, 16)//マージン
        layout.headerReferenceSize = CGSizeMake(100,30)
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellTest")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        self.view.addSubview(myCollectionView)
        
    }
    
    //Cellがクリックされた時によばれます
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("選択しました: \(indexPath.row)")
    }
    
    //Cellの合計数
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    //Cellオブジェクトを返す。ここでカスタムセルにしたりするとそれぞれ変更できる。
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellTest", forIndexPath: indexPath) 
        cell.backgroundColor = UIColor.redColor()
        
        //-----
        //おまけ、Swiftサラリーマンのおっさんの顔
//        let url = NSURL(string:"http://swift-salaryman.com/files/image/page_top.gif");
//        var err: NSError?;
//        var imageData = NSData(contentsOfURL:url!,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!;
        let img = UIImage(named: "smile.png")
//        var img = UIImage(data:imageData);
        let iv = UIImageView(image:img);
        iv.frame = CGRectMake(0, 0, 50, 50);
        iv.backgroundColor = UIColor.greenColor();
        cell.addSubview(iv);
        //-----
        
        return cell
    }
    
}