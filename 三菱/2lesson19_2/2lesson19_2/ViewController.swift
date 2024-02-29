//
//  ViewController.swift
//  2lesson19_2
//
//  Created by 徐國堂 on 2024/2/27.
//

import UIKit
class MyCell:UITableViewCell{
    override func updateConfiguration(using state: UICellConfigurationState){
        var back = UIBackgroundConfiguration.listPlainCell().updated(for: state)
        if state.isSelected || state.isHighlighted{
            back.backgroundColor = .lightGray.withAlphaComponent(0.4)
        }else{
            back.backgroundColor = .lightGray.withAlphaComponent(0.2)
        }
        self.backgroundConfiguration = back
    }
}

class ViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    let cellId = "CELL"
    var cities = [City]()
    let searchController = UISearchController(searchResultsController: nil)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        if let cities = DataSource.main.getCities(){
            self.cities = cities
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "世界城市"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        //建立搜尋的介面
        tableView.tableHeaderView = searchController.searchBar
        
    }

}

extension ViewController:UITableViewDataSource{
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        return self.cities.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MyCell
        var configuration = cell.defaultContentConfiguration()
        let city = cities[indexPath.row]
        configuration.text = city.name
        configuration.secondaryText = city.country
        configuration.textToSecondaryTextVerticalPadding = 10
        let sourceImage = UIImage(named: city.image)
        let targetSize = CGSize(width: 80, height: 50)
        let imageRender = UIGraphicsImageRenderer(size: targetSize)
        let resizeImage = imageRender.image { context in
            sourceImage?.draw(in: CGRect.init(origin: .zero, size: targetSize))
        }
        configuration.image = resizeImage
        cell.contentConfiguration = configuration
        return cell
    }
}

extension ViewController:UITableViewDelegate{
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat{
        //return UITableView.automaticDimension
        return 80
    }
}

