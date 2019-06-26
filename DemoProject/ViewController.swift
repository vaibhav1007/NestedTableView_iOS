//
//  ViewController.swift
//  DemoProject
//
//  Created by Vaibhav Gupta on 26/06/19.
//  Copyright © 2019 Vaibhav Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    let mainTableData = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam mollis hendrerit venenatis. Fusce urna nunc, dictum sit amet sagittis vitae.","Nullam blandit nisl odio, id porta massa fringilla id. Curabitur interdum urna ut lorem tristique, a ultrices ligula congue. Fusce lacinia purus nibh, sagittis blandit massa sollicitudin at. Aenean pharetra, lorem at posuere tempor, ligula nibh mattis tellus, vel tincidunt tortor urna id est. Maecenas vehicula, erat vel placerat fringilla, ipsum tortor scelerisque nibh, ut bibendum ligula nulla vitae ipsum.","Sed ipsum odio, dictum ut accumsan vel, laoreet quis lectus. Suspendisse vehicula pulvinar tortor sit amet ultrices. Praesent pharetra, ante et pulvinar finibus, metus massa laoreet nulla, et porttitor orci risus eu diam."]
    
    let tableCellIdentifier = "MainTableViewCell"
    let tableCellIdentifier2 = "MainTableViewCell2"
    var subCellHeight:CGFloat = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTableViewCell()
        NotificationCenter.default.addObserver(self, selector: #selector(self.tableUpdated(notification:)), name: Notification.Name("tableUpdated"), object: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func tableUpdated(notification: Notification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let height = dict["height"] as? CGFloat{
                self.subCellHeight = height
            }
        }
        mainTableView.reloadData()
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "tableUpdated"), object: nil)
    }
    
    func setTableViewCell(){
        mainTableView.register(UINib(nibName: tableCellIdentifier, bundle: nil), forCellReuseIdentifier: tableCellIdentifier)
        mainTableView.register(UINib(nibName: tableCellIdentifier2, bundle: nil), forCellReuseIdentifier: tableCellIdentifier2)
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Main Table Data"
        default:
            return "Sub Table Data"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return mainTableData.count
        default:
            return 1 //just to show table view
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! MainTableViewCell
            cell.nameLabel.text = mainTableData[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier2, for: indexPath) as! MainTableViewCell2
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return UITableView.automaticDimension
        default:
            return self.subCellHeight
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
