//
//  HomeViewController.swift
//  OSU!!
//
//  Created by 直井翔汰 on 2018/04/28.
//  Copyright © 2018年 直井翔汰. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ホーム"
        self.tableView.backgroundColor = .lightGray
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 88.0
        tableView.register(UINib(nibName: "LetterCell", bundle: nil), forCellReuseIdentifier: "LetterCell")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: InfoViewに画面遷移
        let cell = tableView.cellForRow(at: indexPath)
        print(cell?.bounds)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LetterCell", for: indexPath) as! LetterCell
        
        if indexPath.row % 3 == 0 {
            cell.messageLabel.text = "____"
        } else if indexPath.row % 3 == 1 {
             cell.messageLabel.text = "fslknflksnglkanglkjnawljkgnawklgnawlgnalwjkgnawklg"
        }
        
        return cell
    }
}
