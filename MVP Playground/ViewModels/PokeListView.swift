//
//  PokemonListView.swift
//  MVP Playground
//
//  Created by Martin Otyeka on 2017-11-07.
//  Copyright © 2017 Flex Messaging Inc. All rights reserved.
//

import UIKit

protocol PokeListView {
    func addPokemon(_ pokemon: Pokemon)
    func getInitialPokemons()
    func showLoadingIndicator()
    func hideLoadingIndicator()
}
