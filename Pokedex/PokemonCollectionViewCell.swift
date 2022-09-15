//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Medet Dönmez on 13.09.2022.
//

import UIKit

//This cell is for first page.

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //We update the cells with pokemon image and text.
    func setup(with pokemon: Pokemon) {
        pokemonImageView.image = pokemon.image
        titleLabel.text = pokemon.title
    }
}
