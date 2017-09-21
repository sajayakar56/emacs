//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by Carol Wang on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    var tableView: UITableView! //tableView for displaying favorites list in text form
    
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //create back button
        backButton = UIButton(frame: CGRect(x: 20, y: 25, width: 60, height: 40))
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.layer.cornerRadius = 8
        backButton.backgroundColor = UIColor.red
        view.addSubview(backButton)
        
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupTableView(){
        
        //Initialize TableView Object here
        tableView = UITableView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + 5, width: view.frame.width, height: view.frame.height - UIApplication.shared.statusBarFrame.maxY))
        //Register the tableViewCell you are using
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        //Set properties of TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 25, right: 0)
        //Add tableView to view
        view.addSubview(tableView)
    }

    func goBack() {
        self.performSegue(withIdentifier: "segueToMain", sender: self)
    }
    
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SearchResultsViewController.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! PokemonTableViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.nameLabel.text = SearchResultsViewController.pokemonList[indexPath.row]?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
