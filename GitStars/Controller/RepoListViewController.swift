//
//  RepoListViewController.swift
//  GitStars
//
//  Created by Othmane on 5/25/18.
//  Copyright © 2018 Othmane. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RepoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Constants
    let requestURL : String = "https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc"
    let indexOfLastRepo : Int = 29
    
    //Variables
    var allRepos : [Repo] = [Repo]()

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
        
        //Get data from api
        getRepoData(url: requestURL)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCustomCell", for: indexPath) as! RepoCustomCell
        
        cell.repoNameLabel.text = allRepos[indexPath.row].repoName
        cell.repoDescriptionLabel.text = allRepos[indexPath.row].repoDescription
        cell.repoOwnerNameLabel.text = allRepos[indexPath.row].repoOwner
        if allRepos[indexPath.row].repoStars >= 1000 {
            
            let formatedStars = allRepos[indexPath.row].repoStars / 1000
            cell.repoStarsLabel.text = "\(String(NSString(format: "%.01f", formatedStars)))k"
            
        }
        else{
            cell.repoStarsLabel.text = String(allRepos[indexPath.row].repoStars)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return allRepos.count
        
    }
    
    //Configure the Table View cells to have an optimal height
    
    func configureTableView() {
        
        repoListTableView.rowHeight = UITableViewAutomaticDimension
        repoListTableView.estimatedRowHeight = 120.0
        
    }
    
    //MARK: - Networking
    
    func getRepoData(url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess {
                print("Sucess! Got the github data")
                let repoJSON : JSON = JSON(response.result.value!)
                self.updateRepoData(json: repoJSON)
            }
            else {
                print("Error: \(String(describing: response.result.error))")
            }
        }
        
    }
    
    //MARK: - JSON Parsing
    
    func updateRepoData(json : JSON) {
        
        for index in 0...indexOfLastRepo {
            if let repoName = json["items"][index]["name"].string {
                let repoDescription = json["items"][index]["description"].string
                let repoOwner = json["items"][index]["owner"]["login"].string
                let repoOwnerAvatar = json["items"][index]["owner"]["avatar_url"].string
                let repoStars = json["items"][index]["stargazers_count"].float
                let newRepo = Repo(name: repoName, description: repoDescription!, owner: repoOwner!, ownerAvatar: repoOwnerAvatar!, stars: repoStars!)
                
                self.allRepos.append(newRepo)
                
                self.configureTableView()
                self.repoListTableView.reloadData()
            }
            else{
                print("Error: could not parse data")
            }
        }
        
    }


}

