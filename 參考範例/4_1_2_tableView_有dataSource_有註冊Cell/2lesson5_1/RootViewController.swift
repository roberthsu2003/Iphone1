//
//  RootViewController.swift
//  2lesson5_1
//
//  Created by 徐國堂 on 2023/12/26.
//

import UIKit


class RootViewController: UITableViewController {
    let cellID = "cellID"
    var cities:[[String:Any]] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let mainBundle = Bundle.main
        if let plistURL = mainBundle.url(forResource: "citylist", withExtension: "plist"){
            //print(plistURL.path())
            do{
                let plistData = try Data(contentsOf: plistURL)
                self.cities = try PropertyListSerialization.propertyList(from: plistData, format: nil) as! [[String:Any]]
            }
            catch
            {
                print("讀檔錯誤")
            }
            
        }
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "城市"
        tableView.dataSource = self //預設就為self
        self.tableView.register(UITableViewCell.self,forCellReuseIdentifier: self.cellID)
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        self.tableView.insetsContentViewsToSafeArea = true
        self.tableView.rowHeight = 100
        
    }

}

extension RootViewController{
    //UITableViewController已經採納UITableViewDataSource
    
    
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        //每個section,多少個row
        return cities.count
    }
    
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        //給Row資料
        let rowIndex = indexPath.row
        let city = cities[rowIndex]
        let cityName = city["City"] as? String
        let countryName = city["Country"] as? String
        let imageName = city["Image"] as? String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if cell.viewWithTag(1) == nil
        {
            var imageView:UIImageView!
            imageView = UIImageView()
            imageView.tag = 1
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 40
            cell.contentView.addSubview(imageView)
            
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.alignment = .leading
            
            let titleLabel = UILabel()
            titleLabel.tag = 2
            titleLabel.font = UIFont(name: "Helvetica-Bold", size: 16)
            titleLabel.lineBreakMode = .byTruncatingTail
            stackView.addArrangedSubview(titleLabel)
            
            
            let subLabel = UILabel()
            subLabel.tag = 3
            subLabel.font = UIFont.systemFont(ofSize: 13)
            subLabel.textColor = .systemGray
            stackView.addArrangedSubview(subLabel)
            
            cell.contentView.addSubview(stackView)
            let d = ["iv":imageView, "stack":stackView]
            stackView.translatesAutoresizingMaskIntoConstraints = false
            imageView.translatesAutoresizingMaskIntoConstraints = false
            var con = [NSLayoutConstraint]()
            con.append(
                imageView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            )
            //設imageView的寬
            
            con.append(
                imageView.widthAnchor.constraint(equalToConstant: 80)
            )
            
            con.append(
                imageView.heightAnchor.constraint(equalTo: imageView.heightAnchor)
            )
            
            
            
            
            con.append(contentsOf:
                NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[stack]-20-|", metrics: nil, views: d as [String : Any])
            )
            
            con.append(
                titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.leadingAnchor)
            )
            
            con.append(
                titleLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -16)
            )
            
            con.append(
                imageView.trailingAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.trailingAnchor)
            )
            NSLayoutConstraint.activate(con)
            
        }
        
        let titleLabel = cell.viewWithTag(2) as! UILabel
        titleLabel.text = cityName
        
        let subLabel = cell.viewWithTag(3) as! UILabel
        subLabel.text = countryName
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        let image = UIImage(named: imageName!)!
        //用等比例的方法
        let imageRender = UIGraphicsImageRenderer(size: CGSize(width: 150, height: 80), format: image.imageRendererFormat)
        let image2 = imageRender.image { _ in
            image.draw(in: CGRect(x: 0, y: 0, width: 150, height: 80))
        }
        
        imageView.image = image2
        
        
        
        return cell
        
        
    }
    
}
