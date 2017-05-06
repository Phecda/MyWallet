//
//  ListTableViewController.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/3/22.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var tempdics = [
        ["name": "购物",
         "data": [
                  ["propertyname":"现金", "price":77.0, "isspent":true, "date":"昨天", "tag":"购物"],
                  ["propertyname":"现金", "price":45.0, "isspent":true, "date":"昨天", "tag":"购物"],
                  ["propertyname":"中国银行", "price":19.8, "isspent":true, "date":"2017-3-27", "tag":"购物"],
                  ["propertyname":"支付宝", "price":40.6, "isspent":true, "date":"2017-3-24", "tag":"购物"],
            ]
        ],
        ["name": "饮食",
         "data": [
            ["propertyname":"中国银行", "price":22.0, "isspent":true, "date":"昨天", "tag":"饮食"],
           ]
        ],
        ["name": "交通",
         "data": [
            ["propertyname":"现金", "price":14.0, "isspent":true, "date":"昨天", "tag":"交通"],
            ]
        ],
        ["name": "还款",
         "data": [
            ["propertyname":"支付宝", "price":17.0, "isspent":false, "date":"2017-3-14", "tag":"还款"]
            ]
        ]
    ]
    
//    var tempdics = [
//        ["name": "中国银行",
//         "data": [
//            ["propertyname":"中国银行", "price":22.0, "isspent":true, "date":"昨天", "tag":"饮食"],
//            ["propertyname":"中国银行", "price":19.8, "isspent":true, "date":"2017-3-27", "tag":"购物"],
//            ]
//        ],
//        ["name": "现金",
//         "data": [
//            ["propertyname":"现金", "price":77.0, "isspent":true, "date":"昨天", "tag":"购物"],
//            ["propertyname":"现金", "price":45.0, "isspent":true, "date":"昨天", "tag":"购物"],
//            ["propertyname":"现金", "price":14.0, "isspent":true, "date":"昨天", "tag":"交通"],
//            ]
//        ],
//        ["name": "支付宝",
//         "data": [
//            
//            ["propertyname":"支付宝", "price":40.6, "isspent":true, "date":"2017-3-24", "tag":"购物"],
//            ["propertyname":"支付宝", "price":17.0, "isspent":false, "date":"2017-3-14", "tag":"还款"]
//            ]
//        ]
//    ]
    
    var tempArr = [
        ["propertyname":"中国银行", "price":45.6, "isspent":true, "date":"昨天", "tag":"购物"],
        ["propertyname":"中国银行", "price":14.0, "isspent":false, "date":"2017-3-24", "tag":"还款"],
        ["propertyname":"工商银行", "price":14.0, "isspent":true, "date":"2017-3-23", "tag":"借出"]
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
        return tempdics.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let dic = tempdics[section]
        let data = dic["data"] as! [Dictionary<String, Any>]
        return data.count
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dic = tempdics[section]
        return dic["name"] as? String
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountitemcell", for: indexPath)
        let dic = tempdics[indexPath.section]
        let arr = dic["data"] as! [Dictionary<String, Any>]
        let data = arr[indexPath.row]
        let propertynamelabel = cell.viewWithTag(10) as! UILabel
        let taglabel = cell.viewWithTag(11) as! UILabel
        let pricelabel = cell.viewWithTag(12) as! UILabel
        let datelabel = cell.viewWithTag(13) as! UILabel

        propertynamelabel.text = data["propertyname"] as? String
        if data["isspent"] as! Bool {
            pricelabel.textColor = UIColor.red
        } else {
            pricelabel.textColor = UIColor(red: 17.0/255, green: 129.0/255, blue: 1.0/255, alpha: 1)
        }
        pricelabel.text = String(data["price"] as! Double)
        taglabel.text = data["tag"] as? String
        datelabel.text = data["date"] as? String

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
