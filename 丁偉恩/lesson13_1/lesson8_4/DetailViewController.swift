//
//  DetailViewController.swift
//  lesson11_4
//
//  Created by 徐國堂 on 2023/4/21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var tableView:UITableView!
    var city:City!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = city.city
        //cityImageView.image = UIImage(named: city.image)
        if let cityImageView = tableView.tableHeaderView as? UIImageView{
            cityImageView.image = UIImage(named: city.image)
        }
        
        tableView.dataSource = self
    }
    

    deinit{
        print("被消滅了")
    }
}

extension DetailViewController:UITableViewDataSource{
    
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 4
    }

    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! DetailViewCell
        switch indexPath.row{
        case 0:
            cell.fieldLabel.text = "城市"
            cell.valueLabel.text = city.city;
        case 1:
            cell.fieldLabel.text = "國家"
            cell.valueLabel.text = city.country;
        case 2:
            cell.fieldLabel.text = "洲"
            cell.valueLabel.text = city.continent;
        case 3:
            cell.fieldLabel.text = "網址"
            cell.valueLabel.text = city.url;
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = "";
        }
           
       return cell
    }
    
    
    
    
    
}
