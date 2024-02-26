//
//  ImageViewController.swift
//  lesson6_4
//
//  Created by 徐國堂 on 2024/2/26.
//

import UIKit
//建立全新的Model,儲存資料並加入其它資料
class Model{
    var cityId:Int
    var cityName:String
    var continent:String
    var country:String
    var imageName:String
    var imageURL:URL?
    var image:UIImage?
    var task:URLSessionTask?
    
    init(cityId: Int, cityName: String, continent: String, country: String, imageName: String) {
        self.cityId = cityId
        self.cityName = cityName
        self.continent = continent
        self.country = country
        self.imageName = imageName
    }
}

class ImageViewController: UITableViewController {
    var models = [Model]()
    var infos:[Root.City]? = nil {
        didSet{
            for item in infos!{
                let model = Model(cityId: item.cityId, cityName: item.cityName, continent: item.continent, country: item.country, imageName: item.image)
                let urlPath = "https://webapi-2rhb.onrender.com/cities/image/\(model.cityName)"
                model.imageURL = URL(string: urlPath)
                models.append(model)
            }
        }
    }
    
    lazy var downloader = Downloader()

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        for model in self.models{
            print(model.imageURL as Any)
        }
         */
        self.tableView.dataSource = self
        self.tableView.prefetchDataSource = self
    }

}
let cellID = "CELL"
extension ImageViewController{
    //UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MyCell
        var configure = cell.defaultContentConfiguration()
        let model = models[indexPath.row]
        
        configure.text = model.cityName
        configure.secondaryText = model.country
        configure.image = model.image //一開始是nil,所以不會顯示
        //限定image的大小width=80, height=50
        configure.imageProperties.reservedLayoutSize = CGSize(width: 80, height: 50)
        if model.task == nil && model.image == nil{
            //有bug,一開始不會去fetching資料,要滑動才會,只有使用手動的方式,要求fetch資料
            self.tableView(tableView,prefetchRowsAt:[indexPath])
        }
        configure.textToSecondaryTextVerticalPadding = 10
        configure.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        cell.contentConfiguration = configure
        return cell
    }
    
    
}
extension ImageViewController:UITableViewDataSourcePrefetching{
    func tableView(
        _ tableView: UITableView,
        prefetchRowsAt indexPaths: [IndexPath]
    ){
        for indexPath in indexPaths{
            let model = self.models[indexPath.row]
            guard model.image == nil else{
                print("image已經下載")
                return
            }
            /*
            guard model.task == nil else{
                print("下載任務已經有了")
                return
            }
             */
            //開始下載任務
            print("開始下載一列的資料\(indexPath)")
            model.task = self.downloader.download(url: model.imageURL!) { (url:URL?) in
                if let url=url, let data = try? Data(contentsOf:url){
                    print("取得row的圖片完成\(indexPath)")
                    let targetSize = CGSize(width: 80, height: 50)
                    if let image = UIImage(data: data){
                        let render = UIGraphicsImageRenderer(size: targetSize)
                        let resizeImage = render.image { _ in
                            image.draw(in: CGRect.init(origin: .zero, size: targetSize))
                        }
                        model.image = resizeImage
                    }
                    
                    tableView.reloadRows(at: [indexPath], with: .none)
                }
            }
        }
    }
}
