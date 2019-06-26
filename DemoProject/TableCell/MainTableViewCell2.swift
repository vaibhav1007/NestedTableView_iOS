//
//  MainTableViewCell2.swift
//  DemoProject
//
//  Created by Vaibhav Gupta on 26/06/19.
//  Copyright © 2019 Vaibhav Gupta. All rights reserved.
//

import UIKit

class MainTableViewCell2: UITableViewCell {

    @IBOutlet weak var subTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    let subTableData = ["Allow miles wound place the leave had. To sitting subject no improve studied limited. Ye indulgence unreserved connection alteration appearance my an astonished. Up as seen sent make he they of. Her raising and himself pasture believe females. Fancy she stuff after aware merit small his. Charmed esteems luckily age out.","Hello","It if sometimes furnished unwilling as additions so. Blessing resolved peculiar fat graceful ham. Sussex on at really ladies in as elinor. Sir sex opinions age properly extended. Advice branch vanity or do thirty living. Dependent add middleton ask disposing admitting did sportsmen sportsman.","Own are pretty spring suffer old denote his. By proposal speedily mr striking am. But attention sex questions applauded how happiness. "]
    let subTableCellIdentifier = "MainTableViewCell"
    var totalRowHeight:CGFloat = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupSubTable()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupSubTable(){
        subTableView.delegate = self
        subTableView.dataSource = self
        subTableView.register(UINib(nibName: subTableCellIdentifier, bundle: nil), forCellReuseIdentifier: subTableCellIdentifier)
    }
    
}

extension MainTableViewCell2 : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: subTableCellIdentifier, for: indexPath) as! MainTableViewCell
        cell.nameLabel.text = subTableData[indexPath.row]
        cell.nameLabel.textColor = UIColor.red
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let height = tableView.contentSize.height
        DispatchQueue.main.async {
            self.tableViewHeight.constant = height
        }
        
        if indexPath.row == subTableData.count-1{
            NotificationCenter.default.post(name: Notification.Name("tableUpdated"), object: nil, userInfo: ["height":height])
        }
    }
}
