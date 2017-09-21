
//
//  WebViewController.swift
//  Pokedex
//
//  Created by Carol Wang on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    var url: String!
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backButton = UIButton(frame: CGRect(x: 20, y: 25, width: 60, height: 40))
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.layer.cornerRadius = 8
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.backgroundColor = UIColor.red
        view.addSubview(backButton)
        
        let myWebView: UIWebView = UIWebView(frame: view.frame)
        let urlStr : NSString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)! as NSString
        let searchURL : URL = URL(string: urlStr as String)!
        myWebView.loadRequest(URLRequest(url: searchURL))
        view.addSubview(myWebView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBack() {
        self.performSegue(withIdentifier: "toPokemonVC", sender: self)
    }
    
}
