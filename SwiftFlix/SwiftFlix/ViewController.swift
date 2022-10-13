//
//  ViewController.swift
//  SwiftFlix
//
//  Created by Larissa de Souza Lanes Goncalves on 11/10/22.
//

import UIKit

class ViewController: UIViewController {

    var info: [MoviesData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
       
        TMDB_API.getMovies(onComplete: { (info) in
            
            DispatchQueue.main.async {
                self.info = info
                print(info)
            }
            
        }) { (Errors) in
            print(Errors)
        }
    }
}
