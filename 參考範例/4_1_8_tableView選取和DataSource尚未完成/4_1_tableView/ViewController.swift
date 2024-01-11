//
//  ViewController.swift
//  4_1_tableView
//
//  Created by 徐國堂 on 2023/12/26.
//

import UIKit

//檢查documents有沒有檔案,沒檔案,讀bundle檔,轉換檔案,並存檔
//檢查documents有沒有檔案,有檔案,讀檔案

class ViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    let cellID = "cellID"
    var cities = [City]()
    
    required init?(coder: NSCoder) 
    {
        cities = DataSource.main.cities
        super.init(coder: coder)
        self.tabBarItem.title = "City"
        self.tabBarItem.image = UIImage(systemName: "sun.min")
        self.tabBarItem.selectedImage = UIImage(systemName: "sun.min.fill")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CityDetail"{
            let city = sender as! City
            print(city)
        }
    }


}

extension ViewController:UITableViewDataSource{
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        return cities.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        let rowIndex = indexPath.row
        let city = cities[rowIndex]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = city.city
        contentConfiguration.secondaryText = city.country
        
        let sourceImage = UIImage(named: city.image)!
        
        let imageRenger = UIGraphicsImageRenderer(size: CGSize(width: 75, height: 40), format: sourceImage.imageRendererFormat)
        
        let smallImage = imageRenger.image{
            (context:UIGraphicsImageRendererContext) -> Void in
            sourceImage.draw(in: CGRect(x: 0, y: 0, width: 75, height: 40))
        }
        
        contentConfiguration.image = smallImage
        contentConfiguration.imageProperties.maximumSize = CGSize(width: 75, height: 40)
        
        cell.contentConfiguration = contentConfiguration
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension ViewController:UITableViewDelegate{
        
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ){
        let city = cities[indexPath.row]
        self.performSegue(withIdentifier: "CityDetail", sender: city)
    }
}

