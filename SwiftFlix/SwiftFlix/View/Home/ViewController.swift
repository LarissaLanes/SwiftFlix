//
//  ViewController.swift
//  SwiftFlix
//
//  Created by Larissa de Souza Lanes Goncalves on 11/10/22.
//

import UIKit

class ViewController: UIViewController {
 
    let tableView = UITableView()
    var moviesData: [MoviesData] = []
    var currentPage = 1
    var total = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CollectionHomeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CollectionHomeTableViewCell")

        TMDB_API.getMovies(page: currentPage,onComplete: { (moviesData) in
            
            DispatchQueue.main.async {
                self.moviesData = moviesData
                self.tableView.reloadData()
            }
        }) { (Errors) in
            print(Errors)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController:  UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionHomeTableViewCell", for: indexPath) as! CollectionHomeTableViewCell
        cell.data = moviesData

       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200.0
    }
    
}

