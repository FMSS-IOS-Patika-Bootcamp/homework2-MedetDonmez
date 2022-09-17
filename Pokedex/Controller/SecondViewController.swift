//
//  ThirdViewController.swift
//  Pokedex
//
//  Created by Medet Dönmez on 13.09.2022.
//

import UIKit
import CollectionViewPagingLayout

class SecondViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    
    var delegate: SecondViewControllerDelegate?
    var pokemons = [Pokemon]()
    var webLink = ""
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        infoButton.layer.cornerRadius = 8
        title = delegate?.getTitle()
        update()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //third party library adjustments.
        let layout = CollectionViewPagingLayout()
        collectionView.collectionViewLayout = layout
        layout.numberOfVisibleItems = nil
        layout.delegate = self


    }

    func update(){
        pokemons = delegate!.getPokemons()
    }
    
    @IBAction func infoButton(_ sender: UIButton) {
        performSegue(withIdentifier:"goToWeb", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeb",
           let webViewController = segue.destination as? WebViewController {
            webViewController.webLink = self.webLink
        }
    }
}



//MARK: - UICollectionViewDataSource


//number of items is equal to our pokemons list.
extension SecondViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Registering our cell here.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ThirdCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
        cell.setup(with: pokemons[indexPath.row])
        // we set the cell with our setup func.
        cell.layer.cornerRadius = 20
        return cell
    }
}

//MARK: - CollectionViewPagingLayoutDelegate

//this delegate for update our weblink by page we are currently on.
extension SecondViewController: CollectionViewPagingLayoutDelegate {
    
    func onCurrentPageChanged(layout: CollectionViewPagingLayout, currentPage: Int) {
        
        webLink = pokemons[currentPage].title
    }
}


