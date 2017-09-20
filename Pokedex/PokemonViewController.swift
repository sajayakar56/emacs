//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Carol Wang on 9/19/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    // remove this shit
    var pdb: PDB = PDB()
    var pokemon: Pokemon!
    // var pokemon: Pokemon!
    var pokemonImage: UIImageView!
    var pokemonName: UITextView!
    var pokemonType: UIImageView!
    // change from text view to table view
    var pokemonStats: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // remove this
        pokemon = pdb.searchName(name: "Pikachu")!
        setupUI()
    }

    func setupUI() {
        let VFW = view.frame.width
        let VFH = view.frame.height
        // adding the pokemon image
        pokemonImage = UIImageView(frame: CGRect(x: VFW * 0.1, y: VFH * 0.1, width: 40, height: 40))
        pokemonImage.image = pokemon.getImage()
        pokemonImage.contentMode = .scaleAspectFill
        view.addSubview(pokemonImage)
        
        // pokemon name
        pokemonName = UITextView(frame: CGRect(x: VFW * 0.6, y: VFH * 0.2, width: VFW * 0.5, height: 40))
        pokemonName.text = String(pokemon.number) + " " + pokemon.name
        view.addSubview(pokemonName)
        
        // pokemon type image (only supports one type right now needs to be changed!)
        pokemonType = UIImageView(frame: CGRect(x: VFW * 0.6, y: VFH * 0.24, width: VFW * 0.5, height: 40))
        pokemonType.image = UIImage(named: pokemon.types[0].lowercased())
        pokemonType.contentMode = .scaleAspectFit
        view.addSubview(pokemonType)
        
        // pokemon stats
        pokemonStats = UITextView(frame: CGRect(x: VFW * 0.1, y: VFH * 0.4, width: VFW * 0.8, height: VFH * 0.6))
        pokemonStats.text = "HP: " + String(pokemon.health) + "\n"
        pokemonStats.text = pokemonStats.text + "ATK: " + String(pokemon.attack) + "\n"
        pokemonStats.text = pokemonStats.text + "DEF: " + String(pokemon.defense) + "\n"
        pokemonStats.text = pokemonStats.text + "SPATK: " + String(pokemon.specialAttack) + "\n"
        pokemonStats.text = pokemonStats.text + "SPDEF: " + String(pokemon.specialDefense) + "\n"
        pokemonStats.text = pokemonStats.text + "SPD: " + String(pokemon.speed) + "\n"
        pokemonStats.text = pokemonStats.text + "Species: " + String(pokemon.species) + "\n"
        pokemonStats.text = pokemonStats.text + "Total: " + String(pokemon.total) + "\n"
        view.addSubview(pokemonStats)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
