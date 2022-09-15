//
//  WebViewController.swift
//  Pokedex
//
//  Created by Medet Dönmez on 13.09.2022.
//

import UIKit
import WebKit
import Foundation

class WebViewController: UIViewController {
    
    var webLink = ""
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting our URL
        if let url = URL.init(string: "https://www.pokemon.com/us/pokedex/\(webLink)") {
            
            let URLRequest = URLRequest.init(url: url)
            webView.load(URLRequest)
        }
    }
}
