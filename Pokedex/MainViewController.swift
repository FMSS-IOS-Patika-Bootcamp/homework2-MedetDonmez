//
//  ViewController.swift
//  Pokedex
//
//  Created by Medet Dönmez on 13.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "POKEDEX 1.0"
        
        //we set these values to manage our collection view.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    
    //This function update our pokemon list by the selected type.
    func updateList(selectedType: String){
        webLink = selectedType
        
        switch selectedType {
        case "Water":
            expectedTitle = "WATER POKEMONS"
            pokemons = waterPokemons
        case "Fire":
            expectedTitle = "FIRE POKEMONS"
            pokemons = firePokemons
        case "Grass":
            expectedTitle = "GRASS POKEMONS"
            pokemons = grassPokemons
        case "Electric":
            expectedTitle = "ELECTRIC POKEMONS"
            pokemons = electricPokemons
        case "Psychic":
            expectedTitle = "PSYCHIC POKEMONS"
            pokemons = psychicPokemons
        case "Poison":
            expectedTitle = "POISON POKEMONS"
            pokemons = poisonPokemons
        default:
            print("did nothing")
            
        }
    }
}

//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    //number of items is equal to our pokemons list.
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Registering our cell here.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        
        cell.setup(with: pokemons[indexPath.row]) // we set the cell with our setup func.
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    //Setting the sizes like that because we want to have two columns.
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width/2, height: 300)
        
    }
    
    //Line and item spacing adjustments here.
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //updating list before go to next view controller.
        updateList(selectedType: pokemons[indexPath.row].title)
        
        self.performSegue(withIdentifier: "goToPokemons", sender: self)
    }
}
