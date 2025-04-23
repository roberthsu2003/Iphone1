//
//  DetailViewController.swift
//  lesson12_4
//
//  Created by 徐國堂 on 2025/4/16.
//

import UIKit

class DetailViewController: UITableViewController {
    @IBOutlet var cityImageView: UIImageView!
    
    var city = City()

    override func viewDidLoad() {
        super.viewDidLoad()
        cityImageView.image = UIImage(named: city.image)
        
        //設定cell為自動調整高度
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GO_RATE_VIEWCONTROLLER"{
            let rateViewController = segue.destination as! RateViewController
            rateViewController.city = self.city
        }
    }
    
    @IBAction func userClickShareButton(_ sender: Any) {
        self.performSegue(withIdentifier: "GO_RATE_VIEWCONTROLLER", sender: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CITYCELL", for: indexPath) as! DetailViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "城市"
            cell.valueLabel.text = city.city
        case 1:
            cell.fieldLabel.text = "國家"
            cell.valueLabel.text = city.country
        case 2:
            cell.fieldLabel.text = "洲"
            cell.valueLabel.text = city.continent
        case 3:
            cell.fieldLabel.text = "網址"
            cell.valueLabel.text = city.url
        case 4:
            cell.fieldLabel.text = "說明"
            cell.valueLabel.text = city.local
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
       
       

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
