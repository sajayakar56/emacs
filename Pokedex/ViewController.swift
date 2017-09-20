//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

// The Starting Screen / Opening screen
import UIKit

class ViewController: UIViewController {
    var searchBar: UISearchBar!
    var pdb: PDB! //pokemon database
    var pokemon: [Pokemon]! //array of pokemon search results
    
    var pokemonToPass: Pokemon!
    
    var tableView: UITableView! //tableView for displaying search results
    
    var modeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI();
        pdb = PDB()
    }

    func setupUI() {
        let VFH = view.frame.height
        let VFW = view.frame.width
        searchBar = UISearchBar(frame: CGRect(x: 0,
                                              y: 20,
                                              width: VFW,
                                              height: 50))
        searchBar.placeholder = "Search Pokédex..."
        view.addSubview(searchBar)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        /*modeButton = UIButton(frame: CGRect(x: 15, y: 20, width: 100, height: 40))
        modeButton.setTitle("Start", for: .normal)
        modeButton.setTitleColor(UIColor.white, for: .normal)
        modeButton.backgroundColor = UIColor(red: 0, green: 153/255, blue: 51/255, alpha: 0.95)
        modeButton.layer.cornerRadius = 8
        modeButton.addTarget(self, action: #selector(toggleButton), for: .touchUpInside)
        view.addSubview(modeButton)*/
        
        setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissKeyboard() {
        //Makes the keyboard go bakc down
        self.searchBar.endEditing(true)
    }
    
    func setupTableView(){
        //Initialize TableView Object here
        tableView = UITableView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.1 + 10, width: view.frame.width, height: view.frame.height - UIApplication.shared.statusBarFrame.maxY))
        //Register the tableViewCell you are using
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        //Set properties of TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50/2, right: 0)
        //Add tableView to view
        view.addSubview(tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPokemonVC" {
            let pokemonVC = segue.destination as! PokemonViewController
            pokemonVC.pokemon = pokemonToPass
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! PokemonTableViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.nameLabel.text = pokemon[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokemonToPass = pokemon[indexPath.row]
        performSegue(withIdentifier: "segueToPokemonVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
