//
//  ThirdCollectionViewCell.swift
//  Pokedex
//
//  Created by Medet Dönmez on 13.09.2022.
//

import UIKit
import CollectionViewPagingLayout

//This cell is for first page.

class SecondCollectionViewCell: UICollectionViewCell,ScaleTransformView {
    
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var PokeImageView: UIImageView!
    
    
    //third party library adjustment for paging animation.
    var scaleOptions = ScaleTransformViewOptions(
            minScale: 1.27,
            maxScale: 1.07,
            scaleRatio: 0.00,
            translationRatio: .zero,
            minTranslationRatio: .zero,
            maxTranslationRatio: .zero,
            keepVerticalSpacingEqual: true,
            keepHorizontalSpacingEqual: true,
            scaleCurve: .linear,
            translationCurve: .linear,
            shadowEnabled: true,
            shadowColor: .black,
            shadowOpacity: 0.60,
            shadowRadiusMin: 2.00,
            shadowRadiusMax: 13.00,
            shadowOffsetMin: .init(width: 0.00, height: 2.00),
            shadowOffsetMax: .init(width: 0.00, height: 6.00),
            shadowOpacityMin: 0.10,
            shadowOpacityMax: 0.10,
            blurEffectEnabled: false,
            blurEffectRadiusRatio: 0.40,
            blurEffectStyle: .light,
            rotation3d: .init(
                angle: 1.90,
                minAngle: -1.05,
                maxAngle: 1.05,
                x: 0.00,
                y: -1.00,
                z: 0.00,
                m34: -0.000500
            ),
            translation3d: .init(
                translateRatios: (0.10, 0.00, -0.70),
                minTranslateRatios: (-0.10, 0.00, -3.00),
                maxTranslateRatios: (0.10, 0.00, 0.00)
            )
        )
    //setting up our cell here.
    
    func setup(with pokemon: Pokemon) {
        PokeImageView.image = pokemon.image
        pokeName.text = pokemon.title
    }
}







