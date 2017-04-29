//
//  AddNewAItemController.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/4/26.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import UIKit

let pickerViewTag = 501
let datePickerTag = 502



class AddNewAItemController: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var tags = ["待定", "饮食", "交通", "健康", "服饰"]
    
    var properties = ["中国银行", "建设银行", "支付宝", "微信钱包"]
    
    var delegate: AddNewAItemControllerDelegate?
    
    var pickerCellRowHeight: CGFloat?
    var pickerIndexPath: IndexPath?

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
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "titledetailcell", for: indexPath)
            cell.textLabel?.text = "从"
            cell.detailTextLabel?.text = "2017年1月1日"
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "datepickercell")!
            let datePicker = cell.viewWithTag(502) as! UIDatePicker
            let df = DateFormatter()
            df.dateFormat = "yyyy年MM月dd日"
            datePicker.date = df.date(from: "2017年1月1日")!
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "titledetailcell", for: indexPath)
            cell.textLabel?.text = "至"
            cell.detailTextLabel?.text = "2017年3月22日"
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "titledetailcell", for: indexPath)
            cell.textLabel?.text = "类别"
            cell.detailTextLabel?.text = "不限"
//        case 4:
//            cell = tableView.dequeueReusableCell(withIdentifier: "pickercell")!
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "titledetailcell", for: indexPath)
            cell.textLabel?.text = "账户"
            cell.detailTextLabel?.text = "支付宝"
        default:
            fatalError("cell wrong")
        }
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 1 ? 200 : self.tableView.rowHeight
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
    
    // MARK: - Picker Animation
    
    /// Determine if the given indexPath has a cell below it with picker
    func hasPickerForIndexPath(_ indexPath: IndexPath) -> Bool {
        
        let targetRow = indexPath.row + 1
        
        if let checkPickerCell = self.tableView.cellForRow(at: IndexPath(row: targetRow, section: indexPath.section)) {
            if let _ = checkPickerCell.viewWithTag(pickerViewTag) {
                return true
            }
            if let _ = checkPickerCell.viewWithTag(datePickerTag) {
                return true
            }
        }
        return false
    }
    
    /// Updates the UIPicker's value to match with the time of the cell above it.
    func updatePicker() {
        if let pickerIP = self.pickerIndexPath {
            let associatedPickerCell = self.tableView.cellForRow(at: pickerIP)
            if let targetedPicker = associatedPickerCell?.viewWithTag(pickerViewTag) as? UIPickerView {
                
            } else if let targetedPicker = associatedPickerCell?.viewWithTag(datePickerTag) as? UIDatePicker {
                
            }
        }
    }
    
    /// Determines if the UITableViewController has a UIDatePicker in any of its cells.
    func hasPicker() -> Bool {
        return self.pickerIndexPath != nil
    }
    
    /// Determines if the given indexPath points to a cell that contains the UIPicker.
    func indexPathHasPicker(_ indexPath: IndexPath) -> Bool {
        return self.hasPicker() && self.pickerIndexPath! == indexPath
    }
    
    /// Determines if the given indexPath points to a cell that contains the start/end times or weekday.
    /*
    func indexPathHasTime(_ indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            
            if self.hasPicker() {
                if self.pickerIndexPath!.row != indexPath.row {
                    // If some new rows need to be added into this section, here should be modified.
                    return true
                }
            } else {
                if [weekdayRow, timeStartRow, timeEndRow].contains(indexPath.row) {
                    return true
                }
            }
        }
        return false
    }
    */
    
    // MARK: - Picker view
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tags.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tags[row]
    }
    
    // MARK: - Date picker view
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: Protocol

protocol AddNewAItemControllerDelegate {
    func addOrEditAccountItemDidCancel(_ controller: AddNewAItemController)
    func addAccountItem(_ controller: AddNewAItemController, didFinishAddingAccountItem item: AccountItem)
    func editAccountItem(_ controller: AddNewAItemController, didFinishEditingAccountItem item: AccountItem)
}
