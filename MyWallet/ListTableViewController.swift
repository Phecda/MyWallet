//
//  ListTableViewController.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/3/22.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var tempArr = [
        ["propertyname":"中国银行", "price":45.6, "isspent":true, "date":"昨天", "tag":"购物"],
        ["propertyname":"中国银行", "price":14.0, "isspent":false, "date":"2017-2-25", "tag":"还款"],
        ["propertyname":"工商银行", "price":14.0, "isspent":true, "date":"2017-2-24", "tag":"借出"]
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tempArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountitemcell", for: indexPath)
        let data = self.tempArr[indexPath.row]
        let propertynamelabel = cell.viewWithTag(10) as! UILabel
        let taglabel = cell.viewWithTag(11) as! UILabel
        let pricelabel = cell.viewWithTag(12) as! UILabel
        let datelabel = cell.viewWithTag(13) as! UILabel

        propertynamelabel.text = data["propertyname"] as! String
        if data["isspent"] as! Bool {
            pricelabel.textColor = UIColor.red
        } else {
            pricelabel.textColor = UIColor(red: 0, green: 142, blue: 0, alpha: 1)
        }
        pricelabel.text = String(data["price"] as! Double)
        taglabel.text = data["tag"] as! String
        datelabel.text = data["date"] as! String

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
