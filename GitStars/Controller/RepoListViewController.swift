//
//  RepoListViewController.swift
//  GitStars
//
//  Created by Othmane on 5/25/18.
//  Copyright © 2018 Othmane. All rights reserved.
//

import UIKit

class RepoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var repoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set self as delegate and data source
        repoListTableView.delegate = self
        repoListTableView.dataSource = self
        
        //Register the custom repo cell
        repoListTableView.register(UINib(nibName: "RepoCustomCell", bundle: nil), forCellReuseIdentifier: "repoCustomCell")
        
        //Adjust table's cells automatically
        configureTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCustomCell", for: indexPath) as! RepoCustomCell
        let testDataArray = ["sdfghjklfdscvbghnjkfdcasxfvghbjnkmfsdavbjnkmfvdcsxcfhgvjbnfedcsvhsdfghjklfdscvbghnjkfdcasxfvghbjnkmfsdavbjnkmfvdcsxcfhgvjbnfedcsvhsdfghjklfdscvbghnjkfdcasxfvghbjnkmfsdavbjnkmfvdcsxcfhgvjbnfedcsvh", "sdfghjklfdscvbghnjkfdcasxfvghbjnkmfsdavbjnkmfvdcsxcfhgvjbnfedcsvhsdfghjklfdscvbghnjkfdcasxfvghbjnkmfsdavbjnkmfvdcsxcfhgvjbnfedcsvhsdfghjklfdscvbghnjkfdcasxfvghbjnkmfsdavbjnkmfvdcsxcfhgvjbnfedcsvh", "sdfghjklfdscvbghnjkfdcasxfvghbjnkmfsdavbjnkmfvdcsxcfhgvjbnfedcsvhsdfghjklfdscvbghnjkfdcasxfvghbjnkmfsdavbjnkmfvdcsxcfhgvjbnfedcsvhsdfghjklfdscvbghnjkfdcasxfvghbjnkmfsdavbjnkmfvdcsxcfhgvjbnfedcsvh"]
        
        cell.repoDescriptionLabel.text = testDataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3; //to be replaced with the actual number of rows needed
        
    }
    
    //Configure the Table View cells to have an optimal height
    func configureTableView() {
        
        repoListTableView.rowHeight = UITableViewAutomaticDimension
        repoListTableView.estimatedRowHeight = 120.0
        
    }


}

