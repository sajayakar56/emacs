//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

// The Starting Screen / Opening screen
import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    var searchBar: UISearchBar!
    var pdb: PDB = PDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI();
    }

    func setupUI() {
        let VFH = view.frame.height;
        let VFW = view.frame.width;
        searchBar = UISearchBar(frame: CGRect(x: 0,
                                              y: 10,
                                              width: VFW,
                                              height: 50))
        searchBar.placeholder = "Search Pokédex..."
        searchBar.delegate = self
        view.addSubview(searchBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var result: Pokemon? = pdb.searchName(name: searchBar.text!)
        if let x = result {
            print(x.toString())
        } else {
            print("search pokemon failed!")
        }
    }
}

