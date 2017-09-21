//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Carol Wang on 9/19/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    var pokemon: Pokemon!
    
    var backButton: UIButton!
    
    var originScreen = 0 //1 for main vc and 2 for search vc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // remove this
        setupUI()
    }

    func setupUI() {
        let VFW = view.frame.width
        let VFH = view.frame.height
        // adding the back button
        backButton = UIButton(frame: CGRect(x: 20, y: 25, width: 60, height: 40))
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.layer.cornerRadius = 8
        backButton.backgroundColor = UIColor.red
        view.addSubview(backButton)
        
        // adding the pokemon image
        let pokemonImage = UIImageView(frame: CGRect(x: VFW * 0.15, y: VFH * 0.15, width: 125, height: 125))
        pokemonImage.image = pokemon.getImage()
        pokemonImage.contentMode = .scaleAspectFill
        view.addSubview(pokemonImage)
        
        // pokemon name
        let pokemonName = UILabel(frame: CGRect(x: backButton.frame.maxX + 15, y: 26, width: VFW * 0.7, height: 40))
        let boldedText  = String(pokemon.number) + ".  " + pokemon.name
        let attris = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)]
        let attributed = NSMutableAttributedString(string:boldedText, attributes:attris)
        pokemonName.attributedText = attributed
        pokemonName.numberOfLines = 0
        pokemonName.lineBreakMode = .byWordWrapping
        pokemonName.sizeToFit()
        
        view.addSubview(pokemonName)
        
        var pokemonTypeImageArray: [UIImageView] = []
        
        // pokemon type image (for loop goes through all types of the pokemon)
        let pokemonType = UIImageView(frame: CGRect(x: pokemonImage.frame.maxX + 9, y: pokemonImage.frame.minY + 30, width: 130, height: 40))
        pokemonType.image = UIImage(named: pokemon.types[0].lowercased())
        pokemonType.contentMode = .scaleAspectFit
        view.addSubview(pokemonType)
        pokemonTypeImageArray.append(pokemonType)
        
        for i in 1..<pokemon.types.count {
            let pokemonType = UIImageView(frame: CGRect(x: pokemonImage.frame.maxX + 9, y: pokemonTypeImageArray[i-1].frame.maxY + 5, width: 130, height: 40))
            pokemonType.image = UIImage(named: pokemon.types[i].lowercased())
            pokemonType.contentMode = .scaleAspectFit
            view.addSubview(pokemonType)
        }
        
        // pokemon stats
        let pokemonHP = UILabel(frame: CGRect(x: VFW * 0.2, y: pokemonImage.frame.maxY + 40, width: VFW * 0.6, height: 40))
        let boldText  = "HP: "
        let attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        let normalText = String(pokemon.health)
        let normalString = NSMutableAttributedString(string:normalText)
        attributedString.append(normalString)
        pokemonHP.attributedText = attributedString
        view.addSubview(pokemonHP)
        
        let pokemonATK = UILabel(frame: CGRect(x: VFW * 0.2, y: pokemonHP.frame.maxY + 5, width: VFW * 0.6, height: 40))
        let boldText2  = "ATTACK: "
        let attrs2 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        let attributedString2 = NSMutableAttributedString(string:boldText2, attributes:attrs2)
        let normalText2 = String(pokemon.attack)
        let normalString2 = NSMutableAttributedString(string:normalText2)
        attributedString2.append(normalString2)
        pokemonATK.attributedText = attributedString2
        view.addSubview(pokemonATK)
        
        let pokemonDEF = UILabel(frame: CGRect(x: VFW * 0.2, y: pokemonATK.frame.maxY + 5, width: VFW * 0.6, height: 40))
        let boldText3  = "DEFENSE: "
        let attrs3 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        let attributedString3 = NSMutableAttributedString(string:boldText3, attributes:attrs3)
        let normalText3 = String(pokemon.defense)
        let normalString3 = NSMutableAttributedString(string:normalText3)
        attributedString3.append(normalString3)
        pokemonDEF.attributedText = attributedString3
        view.addSubview(pokemonDEF)
        
        let pokemonSPATK = UILabel(frame: CGRect(x: VFW * 0.2, y: pokemonDEF.frame.maxY + 5, width: VFW * 0.6, height: 40))
        let boldText4  = "SPECIAL ATTACK: "
        let attrs4 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        let attributedString4 = NSMutableAttributedString(string:boldText4, attributes:attrs4)
        let normalText4 = String(pokemon.specialAttack)
        let normalString4 = NSMutableAttributedString(string:normalText4)
        attributedString4.append(normalString4)
        pokemonSPATK.attributedText = attributedString4
        view.addSubview(pokemonSPATK)
        
        let pokemonSPDEF = UILabel(frame: CGRect(x: VFW * 0.2, y: pokemonSPATK.frame.maxY + 5, width: VFW * 0.6, height: 40))
        let boldText5  = "SPECIAL DEFENSE: "
        let attrs5 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        let attributedString5 = NSMutableAttributedString(string:boldText5, attributes:attrs5)
        let normalText5 = String(pokemon.specialDefense)
        let normalString5 = NSMutableAttributedString(string:normalText5)
        attributedString5.append(normalString5)
        pokemonSPDEF.attributedText = attributedString5
        view.addSubview(pokemonSPDEF)
        
        let pokemonSPD = UILabel(frame: CGRect(x: VFW * 0.2, y: pokemonSPDEF.frame.maxY + 5, width: VFW * 0.6, height: 40))
        let boldText6  = "SPEED: "
        let attrs6 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        let attributedString6 = NSMutableAttributedString(string:boldText6, attributes:attrs6)
        let normalText6 = String(pokemon.speed)
        let normalString6 = NSMutableAttributedString(string:normalText6)
        attributedString6.append(normalString6)
        pokemonSPD.attributedText = attributedString6
        view.addSubview(pokemonSPD)
        
        let pokemonSPE = UILabel(frame: CGRect(x: VFW * 0.2, y: pokemonSPD.frame.maxY + 5, width: VFW * 0.6, height: 40))
        let boldText7  = "SPECIES: "
        let attrs7 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        let attributedString7 = NSMutableAttributedString(string:boldText7, attributes:attrs7)
        let normalText7 = String(pokemon.species)
        let normalString7 = NSMutableAttributedString(string:normalText7!)
        attributedString7.append(normalString7)
        pokemonSPE.attributedText = attributedString7
        view.addSubview(pokemonSPE)
        
        let pokemonTOT = UILabel(frame: CGRect(x: VFW * 0.2, y: pokemonSPE.frame.maxY + 5, width: VFW * 0.6, height: 40))
        let boldText8  = "TOTAL: "
        let attrs8 = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)]
        let attributedString8 = NSMutableAttributedString(string:boldText8, attributes:attrs8)
        let normalText8 = String(pokemon.total)
        let normalString8 = NSMutableAttributedString(string:normalText8)
        attributedString8.append(normalString8)
        pokemonTOT.attributedText = attributedString8
        view.addSubview(pokemonTOT)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBack() {
        if originScreen == 1 {
            self.performSegue(withIdentifier: "toMainVC", sender: self)
        }
        else {
            self.performSegue(withIdentifier: "segueToSearch", sender: self)
        }
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
