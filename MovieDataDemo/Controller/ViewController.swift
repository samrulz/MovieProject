//
//  ViewController.swift
//  MovieDataDemo
//
//  Created by SAGAR THAKARE on 29/12/18.
//  Copyright © 2018 Sandip Musale. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var movieDataArray = [MovieData]()
    var limit = 1

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tv Series"
      loadData(limit: limit)
    }
    
    func loadData(limit : Int){
        let url = "https://api.trakt.tv/shows/trending?extended=full,images&limit=20&page=\(limit)"
        let headers:HTTPHeaders = [
            "Content-Type": "application/json",
            "trakt-api-key":"2e1d97c236b73fdbbdc4edac3fb5f4e22324446beaf306306e3bba61c3bf0412",
            "trakt-api-version":"2"
        ]
        
        requestGetUrl(url: url, params: nil, headers: headers, success: { (data) in
            do{
                let decoder = JSONDecoder()
                let list = try decoder.decode([MovieData].self, from: data!)
                list.forEach({ (elem) in
                    self.movieDataArray.append(elem)
                })
                
                self.tableView.reloadData()
                
            }catch{
                
            }
            
        }) { (error) in
            print(error)
        }
        
    }
    
   
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  movieDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDataCell", for: indexPath) as! MovieDataCell
        
        cell.lblDataName.text = movieDataArray[indexPath.row].show!.title!
        cell.lblDataDescription.text = movieDataArray[indexPath.row].show!.overview!
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movieDataArray.count - 1{
            limit += 1
            loadData(limit: limit)
            
        }
    }
    
    
    
    
}


