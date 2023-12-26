//
//  RootViewController.swift
//  lesson4_1_0_tableView
//
//  Created by 徐國堂 on 2023/12/26.
//

import UIKit

class RootViewController: UITableViewController {
    let cellID = "Cell"
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

   

}

/*
Simple "dequeue" (without "forIndexPath") might return a nil cell, and certainly will at the
outset as the initial stack of reusable cells is needed. This means that everything in the code
has to accommodate this possibility: the cell must be a var because you might need to create
and assign it, the cell must be typed as an Optional, and all references to the cell must be
unwrapped. This is annoying - and completely unnecessary. I'm only showing it here
for illustrative purposes. For the rest of the book, I'll use dequeue...:forIndexPath: which
has none of those issues, and the cell will never be an Optional (or nil) ever again.
*/


extension RootViewController{
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
       //let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
       //上面這行會傳出空的cell,下面這行會傳出nil
        if #available(iOS 15, *)
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil            {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
                var backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
                let image = UIImage(named: "linen.png") //不需要設frame
                backgroundConfiguration.image = image
                cell?.backgroundConfiguration = backgroundConfiguration
            }
            
            var content = cell?.defaultContentConfiguration()
            content?.text = "Hello ther! \(indexPath.row)"
            content?.textProperties.color = .systemBlue
            cell?.contentConfiguration = content
            return cell!
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil
            {
                
                let cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
                
                cell.textLabel!.textColor = .systemGray
                let v = UIImageView(image: UIImage(named: "linen.png")) //不需要設frame
                v.contentMode = .scaleToFill
                cell.backgroundView = v
                /*
                let v2 = UIView() //不需要設frame
                v2.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
                cell.selectedBackgroundView = v2
                cell.backgroundColor = .systemRed
                 */
                
            }
            cell?.textLabel!.text = "Hello ther! \(indexPath.row)"
            return cell!
            
            
        }
        
        
           
       
    }

    
}


