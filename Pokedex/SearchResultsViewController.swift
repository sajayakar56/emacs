//
//  SearchResultsViewController.swift
//  Pokedex
//
//  Created by Carol Wang on 9/19/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    static var pokemonList: [Pokemon?] = [] //list containing pokemons returned from search
    static var favorites: Bool = false
    
    var segmentedControl: UISegmentedControl!   //What we will use to switch between the table and collection views
    var collectionView: UICollectionView!   //collectionView for displaying search results in image form
    var tableView: UITableView! //tableView for displaying search results in text form
    
    var pokemonToPass: Pokemon! //selected pokemon to pass to the page displaying pokemon info
    
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSegmentedControl() {
        //create back button
        backButton = UIButton(frame: CGRect(x: 20, y: 25, width: 60, height: 40))
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.layer.cornerRadius = 8
        backButton.backgroundColor = UIColor.red
        view.addSubview(backButton)
        
        //Initialize SegmentedControl
        segmentedControl = UISegmentedControl(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + 50, width: view.frame.width, height: view.frame.height * 0.05))
        segmentedControl.insertSegment(withTitle: "TableView", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "CollectionView", at: 1, animated: true)
        segmentedControl.layer.cornerRadius = 3
        segmentedControl.addTarget(self, action: #selector(switchView), for: .valueChanged)
        view.addSubview(segmentedControl)
    }
    
    func setupTableView(){
        backButton = UIButton(frame: CGRect(x: 20, y: 25, width: 60, height: 40))
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.layer.cornerRadius = 8
        backButton.backgroundColor = UIColor.red
        view.addSubview(backButton)
        
        //start off with table view in segmented control
        segmentedControl.selectedSegmentIndex = 0
        
        //Initialize TableView Object here
        tableView = UITableView(frame: CGRect(x: 0, y: segmentedControl.frame.maxY + 5, width: view.frame.width, height: view.frame.height - UIApplication.shared.statusBarFrame.maxY))
        //Register the tableViewCell you are using
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        //Set properties of TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 25, right: 0)
        //Add tableView to view
        view.addSubview(tableView)
    }

    func setupCollectionView() {
        backButton = UIButton(frame: CGRect(x: 20, y: 25, width: 60, height: 40))
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.layer.cornerRadius = 8
        backButton.backgroundColor = UIColor.red
        view.addSubview(backButton)
        
        segmentedControl.selectedSegmentIndex = 1
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y: segmentedControl.frame.maxY + 5, width: view.frame.width, height: view.frame.height * 0.9 - UIApplication.shared.statusBarFrame.maxY - 10), collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.lightGray
        view.addSubview(collectionView)
    }
    
    func switchView(sender: UISegmentedControl) {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        view.addSubview(segmentedControl)
        if (sender.selectedSegmentIndex == 0) {
            setupTableView()
        } else {
            setupCollectionView()
        }
    }
    
    func goBack() {
        self.performSegue(withIdentifier: "segueToMain", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPokemonVC" {
            let pokemonVC = segue.destination as! PokemonViewController
            pokemonVC.originScreen = 2
            PokemonViewController.pokemon = pokemonToPass
        }
    }
    
}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        pokemonToPass = SearchResultsViewController.pokemonList[indexPath.row]
        performSegue(withIdentifier: "segueToPokemonVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension SearchResultsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SearchResultsViewController.pokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.pokemonImage.image = SearchResultsViewController.pokemonList[indexPath.row]?.getImage()
        
        //change size of image to make them uniform
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: cell.frame.width * 0.7, height: cell.frame.height * 0.7), !hasAlpha, scale)
        cell.pokemonImage.image?.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: cell.frame.width * 0.7, height: cell.frame.height * 0.7)))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        cell.pokemonImage.image = scaledImage
        
        //bold the label text
        let boldedText  = SearchResultsViewController.pokemonList[indexPath.row]?.name
        let attris = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 12)]
        let attributed = NSMutableAttributedString(string:boldedText!, attributes:attris)
        cell.pokemonName.attributedText = attributed
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pokemonToPass = SearchResultsViewController.pokemonList[indexPath.row]
        performSegue(withIdentifier: "segueToPokemonVC", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: 100)
    }
    
}
