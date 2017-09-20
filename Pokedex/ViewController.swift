//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

// The Starting Screen / Opening screen

// TODO: Filter search results based on mode.

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    var searchBar: UISearchBar!
    
    var modeButton: UIButton!
    var pdb: PDB = PDB()
    
    var pickerView: UIPickerView = UIPickerView() //pickervew to select a mode
    
    var modeArray: [String] = ["Type", "Minimum Attack Points", "Minimum Defense Points", "Minimum Health Points"]
    var selectedMode: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI();
    }

    func setupUI() {
        let VFH = view.frame.height
        let VFW = view.frame.width
        searchBar = UISearchBar(frame: CGRect(x: VFW * 0.1,
                                              y: VFH * 0.3,
                                              width: VFW * 0.8,
                                              height: 100))
        searchBar.placeholder = "Search Pokédex..."
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        modeButton = UIButton(frame: CGRect(x: VFW/2 - 150, y: searchBar.frame.maxY + 20, width: 300, height: 60))
        modeButton.setTitle("Select Mode", for: .normal)
        modeButton.setTitleColor(UIColor.white, for: .normal)
        modeButton.backgroundColor = UIColor.red
        modeButton.layer.cornerRadius = 8
        modeButton.addTarget(self, action: #selector(togglePickerView), for: .touchUpInside)
        view.addSubview(modeButton)
        
        setupPickerView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissKeyboard() {
        //Makes the keyboard go bakc down
        self.searchBar.endEditing(true)
    }
    
    func togglePickerView() {
        if !self.pickerView.isDescendant(of: view) {
            view.addSubview(self.pickerView)
            view.bringSubview(toFront: self.pickerView)
        }
        else {
            self.pickerView.removeFromSuperview()
        }
    }
    
    func setupPickerView() {
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.frame = CGRect(x: 0, y: modeButton.frame.maxY + 5, width: view.frame.width, height: 200)
        self.pickerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSearchVC" {
            let searchVC = segue.destination as! SearchResultsViewController
            searchVC.pokemonList = [] //pass in search results array eventually
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let result: Pokemon? = pdb.searchName(name: searchBar.text!)
        if let x = result {
            print(x.toString())
        } else {
            print("search pokemon failed!")
        }
    }
    
    func changeButtonMode() {
        modeButton.setTitle(selectedMode, for: .normal)
        self.pickerView.removeFromSuperview()
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modeArray.count
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel: UILabel = UILabel()
        pickerLabel.text = modeArray[row]
        pickerLabel.textColor = UIColor.black
        pickerLabel.textAlignment = .center
        pickerLabel.sizeToFit()
        pickerLabel.numberOfLines = 0
        
        return pickerLabel
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMode = modeArray[row]
        changeButtonMode()
        //call segue eventually
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 36.0
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    
}
