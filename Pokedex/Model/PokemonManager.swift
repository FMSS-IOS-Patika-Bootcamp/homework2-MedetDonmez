//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Medet Dönmez on 15.09.2022.
//

import Foundation

protocol SecondViewControllerDelegate {
    func getTitle() -> String
    func getPokemons() -> [Pokemon]
}


struct PokemonManager {
    
    var expectedTitle = ""
    
    var basePokemons: [Pokemon] = [
        Pokemon(title: "Fire", image: #imageLiteral(resourceName: "Fire-1")),
        Pokemon(title: "Water", image: #imageLiteral(resourceName: "water-1")),
        Pokemon(title: "Grass", image: #imageLiteral(resourceName: "grass-6")),
        Pokemon(title: "Electric", image: #imageLiteral(resourceName: "electric-6")),
        Pokemon(title: "Psychic", image: #imageLiteral(resourceName: "psychic-2")),
        Pokemon(title: "Poison", image: #imageLiteral(resourceName: "poison-3"))
    ]
    
    //this array to be changed by selected type in the first screen.
    var pokemons: [Pokemon] = [
        Pokemon(title: "Fire", image: #imageLiteral(resourceName: "Fire-1")),
        Pokemon(title: "Water", image: #imageLiteral(resourceName: "water-1")),
        Pokemon(title: "Grass", image: #imageLiteral(resourceName: "grass-6")),
        Pokemon(title: "Electric", image: #imageLiteral(resourceName: "electric-6")),
        Pokemon(title: "Psychic", image: #imageLiteral(resourceName: "psychic-2")),
        Pokemon(title: "Poison", image: #imageLiteral(resourceName: "poison-3"))
    ]
    
    let firePokemons: [Pokemon] = [
        Pokemon(title: "CHARMANDER", image: #imageLiteral(resourceName: "Fire-1")),
        Pokemon(title: "MAGMAR", image: #imageLiteral(resourceName: "Fire-5")),
        Pokemon(title: "VULPIX", image: #imageLiteral(resourceName: "Fire-2")),
        Pokemon(title: "ARCANINE", image: #imageLiteral(resourceName: "Fire-3")),
        Pokemon(title: "FLAREON", image: #imageLiteral(resourceName: "Fire-4")),
        Pokemon(title: "CYNDAQUIL", image: #imageLiteral(resourceName: "Fire-6"))
    ]
    
    let waterPokemons: [Pokemon] = [
        Pokemon(title: "GOLDUCK", image: #imageLiteral(resourceName: "water-2")),
        Pokemon(title: "SEADRA", image: #imageLiteral(resourceName: "water-3")),
        Pokemon(title: "SQUIRTLE", image: #imageLiteral(resourceName: "water-1")),
        Pokemon(title: "GYARADOS", image: #imageLiteral(resourceName: "water-6")),
        Pokemon(title: "FERALIGATR", image: #imageLiteral(resourceName: "water-5")),
        Pokemon(title: "STARYU", image: #imageLiteral(resourceName: "water-4"))
    ]
    
    let grassPokemons: [Pokemon] = [
        Pokemon(title: "GROTLE", image: #imageLiteral(resourceName: "grass-5")),
        Pokemon(title: "SERPERIOR", image: #imageLiteral(resourceName: "grass-2")),
        Pokemon(title: "SCEPTILE", image: #imageLiteral(resourceName: "grass-3")),
        Pokemon(title: "CACNEA", image: #imageLiteral(resourceName: "grass-4")),
        Pokemon(title: "TANGELA", image: #imageLiteral(resourceName: "grass-1")),
        Pokemon(title: "CHIKORITA", image: #imageLiteral(resourceName: "grass-6"))
    ]
    
    let electricPokemons: [Pokemon] = [
        Pokemon(title: "ELECTRODE", image: #imageLiteral(resourceName: "electric-3")),
        Pokemon(title: "MANECTRIC", image: #imageLiteral(resourceName: "electric-2")),
        Pokemon(title: "LUXRAY", image: #imageLiteral(resourceName: "electric-5")),
        Pokemon(title: "RAIKOU", image: #imageLiteral(resourceName: "electric-4")),
        Pokemon(title: "ELECTABUZZ", image: #imageLiteral(resourceName: "electric-1")),
        Pokemon(title: "PIKACHU", image: #imageLiteral(resourceName: "electric-6"))
    ]
    
    let psychicPokemons: [Pokemon] = [
        Pokemon(title: "MEWTWO", image: #imageLiteral(resourceName: "psychic-1")),
        Pokemon(title: "ALAKAZAM", image: #imageLiteral(resourceName: "psychic-2")),
        Pokemon(title: "DROWZEE", image: #imageLiteral(resourceName: "psychic-3")),
        Pokemon(title: "XATU", image: #imageLiteral(resourceName: "psychic-6")),
        Pokemon(title: "MR. MIME", image: #imageLiteral(resourceName: "psychic-5")),
        Pokemon(title: "ARTICUNO", image: #imageLiteral(resourceName: "psychic-4"))
    ]
    
    let poisonPokemons: [Pokemon] = [
        Pokemon(title: "CROBAT", image: #imageLiteral(resourceName: "poison-6")),
        Pokemon(title: "ARBOK", image: #imageLiteral(resourceName: "poison-3")),
        Pokemon(title: "NIDORINO", image: #imageLiteral(resourceName: "poison-5")),
        Pokemon(title: "GRIMER", image: #imageLiteral(resourceName: "poison-4")),
        Pokemon(title: "DRAPION", image: #imageLiteral(resourceName: "poison-2")),
        Pokemon(title: "WEEZING", image: #imageLiteral(resourceName: "poison-1"))
    ]
    
    var webLink = ""
    
    //function that updates our list
    mutating func uupdateList(selectedType: String){
 
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
            expectedTitle = "POISON POKEMONS"
            pokemons = poisonPokemons
            
        }
    }
}
