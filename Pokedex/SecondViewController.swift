//
//  ThirdViewController.swift
//  Pokedex
//
//  Created by Medet Dönmez on 13.09.2022.
//

import UIKit
import CollectionViewPagingLayout

class SecondViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = expectedTitle
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //third party library adjustments.
        let layout = CollectionViewPagingLayout()
        collectionView.collectionViewLayout = layout
        layout.numberOfVisibleItems = nil
    }
    
    @IBAction func infoButton(_ sender: UIButton) {
        performSegue(withIdentifier:"goToWeb", sender: self)
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
        cell.setup(with: pokemons[indexPath.row]) // we set the cell with our setup func.
        webLink = pokemons[indexPath.row].title
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension SecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Specify the link for the selected pokemon.
        webLink = pokemons[indexPath.row].title
    }
}


