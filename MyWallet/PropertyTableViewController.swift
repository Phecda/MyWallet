//
//  PropertyTableViewController.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/3/21.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import UIKit

class PropertyTableViewController: UITableViewController {
    
    var tempArr = [
        ["propertyname":"中国银行", "price":12300.05, "comments": "尾号8888"],
        ["propertyname":"建设银行", "price":5649.9, "comments": "尾号6666"],
        ["propertyname":"现金", "price": 105.0, "comments": ""],
        ["propertyname":"支付宝", "price":14.0, "comments": "szp@163.com"]
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 70
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.refreshControl = UIRefreshControl()
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
        return 2+self.tempArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "overviewcell", for: indexPath)
            let label1 = cell.viewWithTag(101) as! UILabel
            label1.text = "本月支出： ￥327.6"
            let label2 = cell.viewWithTag(102) as! UILabel
            label2.text = "本月收入： ￥14.0"
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "addaccountcell", for: indexPath)
            let button = cell.viewWithTag(201) as! UIButton
            button.titleLabel!.text = "添加一个账户"
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: "accountcell", for: indexPath)
            let data = tempArr[indexPath.row-2]
            let propertynamelabel = cell.viewWithTag(301) as! UILabel
            let propertycommentname = cell.viewWithTag(302) as! UILabel
            let pricelabel = cell.viewWithTag(303) as! UILabel
            propertynamelabel.text = data["propertyname"] as? String
            propertycommentname.text = data["comments"] as? String
            
            pricelabel.text = String(data["price"] as! Double)
        }

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 80
        case 1:
            return 44
        default:
            return 70
        }
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
