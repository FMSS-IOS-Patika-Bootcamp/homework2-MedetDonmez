//
//  ViewController.swift
//  Pokedex
//
//  Created by Medet Dönmez on 13.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var pokemonManager = PokemonManager()
    
    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "POKEDEX 1.0"
        
        appLabel.text = ""
        var charIndex = 0.0
        let titleText = "POKEDEX"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.12 * charIndex, repeats: false) { (timer) in
                self.appLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        
        //we set these values to manage our collection view.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPokemons",
           let secondViewController = segue.destination as? SecondViewController {
            secondViewController.delegate = self
        }
    }
}

//MARK: - SecondViewControllerDelegate

//to pass data we need this delegate method.

extension MainViewController: SecondViewControllerDelegate {
    func getPokemons() -> [Pokemon] {
        return pokemonManager.pokemons
    }
    
    func getTitle() -> String {
        return pokemonManager.expectedTitle
    }
}

//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    //number of items is equal to our pokemons list.
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonManager.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Registering our cell here.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        
        cell.setup(with: pokemonManager.pokemons[indexPath.row]) // we set the cell with our setup func.
        cell.layer.borderWidth = 4
        cell.layer.borderColor = #colorLiteral(red: 0.3294117647, green: 0.231372549, blue: 0.3294117647, alpha: 1)
        cell.layer.cornerRadius = 8
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
        pokemonManager.pokemons = pokemonManager.basePokemons
        pokemonManager.uupdateList(selectedType: pokemonManager.pokemons[indexPath.row].title)
        
        self.performSegue(withIdentifier: "goToPokemons", sender: self)
    }
}


