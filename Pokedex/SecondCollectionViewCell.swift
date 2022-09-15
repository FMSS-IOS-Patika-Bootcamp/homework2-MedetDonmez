//
//  ThirdCollectionViewCell.swift
//  Pokedex
//
//  Created by Medet Dönmez on 13.09.2022.
//

import UIKit
import CollectionViewPagingLayout

//This cell is for first page.

class SecondCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var PokeImageView: UIImageView!
    
    //setting up our cell here.
    
    func setup(with pokemon: Pokemon) {
        PokeImageView.image = pokemon.image
        pokeName.text = pokemon.title
    }
}

//MARK: - SnapshotTransfromView

//third party library adjustment for paging animation.

extension SecondCollectionViewCell: SnapshotTransformView{
    var snapshotOptions: SnapshotTransformViewOptions {
        .layout(.chess)
    }
}






