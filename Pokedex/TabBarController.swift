//
//  TabBarController.swift
//  Pokedex
//
//  Created by Stephen Jayakar on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

class TabBarController: UITabBarController {
    // should remove this and have it piped in
    
    var favorites = defaults.array(forKey: "favorites")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
        if (favorites == nil) {
            favorites = []
            defaults.set([], forKey: "favorites")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            print("Loading favorites")
            let originalVC = self.viewControllers?[0] as! ViewController
            originalVC.pokemonSearch = originalVC.pdb.namesToPokemon(names: favorites as! [String])
            SearchResultsViewController.pokemonList = originalVC.pokemonSearch
            SearchResultsViewController.favorites = true
        }
    }
}
