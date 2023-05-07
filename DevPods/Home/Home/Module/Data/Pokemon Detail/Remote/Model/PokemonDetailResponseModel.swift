//
//  PokemonDetailResponseModel.swift
//  Home
//
//  Created by Car mudi on 08/02/23.
//

public struct PokemonDetailResponseModel: Codable {
    public let baseHappiness, captureRate: Int
    public let color: flavorText
    public let eggGroups: [flavorText]
    public let evolutionChain: EvolutionChain
    public let evolvesFromSpecies: flavorText?
    public let flavorTextEntries: [FlavorTextEntry]
    public let formsSwitchable: Bool
    public let genderRate: Int
    public let genera: [Genus]
    public let generation, growthRate, habitat: flavorText
    public let hasGenderDifferences: Bool
    public let hatchCounter, id: Int
    public let isBaby, isLegendary, isMythical: Bool
    public let name: String
    public let names: [Name]
    public let order: Int
    public let palParkEncounters: [PalParkEncounter]
    public let pokedexNumbers: [PokedexNumber]
    public let shape: flavorText
    public let varieties: [Variety]
    
    enum CodingKeys: String, CodingKey {
        case baseHappiness = "base_happiness"
        case captureRate = "capture_rate"
        case color
        case eggGroups = "egg_groups"
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case flavorTextEntries = "flavor_text_entries"
        case formsSwitchable = "forms_switchable"
        case genderRate = "gender_rate"
        case genera, generation
        case growthRate = "growth_rate"
        case habitat
        case hasGenderDifferences = "has_gender_differences"
        case hatchCounter = "hatch_counter"
        case id
        case isBaby = "is_baby"
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case name, names, order
        case palParkEncounters = "pal_park_encounters"
        case pokedexNumbers = "pokedex_numbers"
        case shape, varieties
    }
    
    public init(
        baseHappiness: Int,
        captureRate: Int,
        color: flavorText,
        eggGroups: [flavorText],
        evolutionChain: EvolutionChain,
        evolvesFromSpecies: flavorText?,
        flavorTextEntries: [FlavorTextEntry],
        formsSwitchable: Bool,
        genderRate: Int,
        genera: [Genus],
        generation: flavorText,
        growthRate: flavorText,
        habitat: flavorText,
        hasGenderDifferences: Bool,
        hatchCounter: Int,
        id: Int,
        isBaby: Bool,
        isLegendary: Bool,
        isMythical: Bool,
        name: String,
        names: [Name],
        order: Int,
        palParkEncounters: [PalParkEncounter],
        pokedexNumbers: [PokedexNumber],
        shape: flavorText,
        varieties: [Variety]
    ) {
        self.baseHappiness = baseHappiness
        self.captureRate = captureRate
        self.color = color
        self.eggGroups = eggGroups
        self.evolutionChain = evolutionChain
        self.evolvesFromSpecies = evolvesFromSpecies
        self.flavorTextEntries = flavorTextEntries
        self.formsSwitchable = formsSwitchable
        self.genderRate = genderRate
        self.genera = genera
        self.generation = generation
        self.growthRate = growthRate
        self.habitat = habitat
        self.hasGenderDifferences = hasGenderDifferences
        self.hatchCounter = hatchCounter
        self.id = id
        self.isBaby = isBaby
        self.isLegendary = isLegendary
        self.isMythical = isMythical
        self.name = name
        self.names = names
        self.order = order
        self.palParkEncounters = palParkEncounters
        self.pokedexNumbers = pokedexNumbers
        self.shape = shape
        self.varieties = varieties
    }
}

public struct flavorText: Codable {
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

// MARK: - EvolutionChain
public struct EvolutionChain: Codable {
    public let url: String
    
    public init(url: String) {
        self.url = url
    }
}

// MARK: - FlavorTextEntry
public struct FlavorTextEntry: Codable {
    public let flavorText: String
    public let language, version: flavorText
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }
    
    public init(flavorText: String, language: flavorText, version: flavorText) {
        self.flavorText = flavorText
        self.language = language
        self.version = version
    }
}

// MARK: - Genus
public struct Genus: Codable {
    public let genus: String
    public let language: flavorText
    
    public init(genus: String, language: flavorText) {
        self.genus = genus
        self.language = language
    }
}

// MARK: - Name
public struct Name: Codable {
    public let language: flavorText
    public let name: String
    
    public init(language: flavorText, name: String) {
        self.language = language
        self.name = name
    }
}

// MARK: - PalParkEncounter
public struct PalParkEncounter: Codable {
    public let area: flavorText
    public let baseScore, rate: Int
    
    enum CodingKeys: String, CodingKey {
        case area
        case baseScore = "base_score"
        case rate
    }
    
    public init(area: flavorText, baseScore: Int, rate: Int) {
        self.area = area
        self.baseScore = baseScore
        self.rate = rate
    }
}

// MARK: - PokedexNumber
public struct PokedexNumber: Codable {
    public let entryNumber: Int
    public let pokedex: flavorText
    
    enum CodingKeys: String, CodingKey {
        case entryNumber = "entry_number"
        case pokedex
    }
    
    public init(entryNumber: Int, pokedex: flavorText) {
        self.entryNumber = entryNumber
        self.pokedex = pokedex
    }
}

// MARK: - Variety
public struct Variety: Codable {
    public let isDefault: Bool
    public let pokemon: flavorText
    
    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case pokemon
    }
    
    public init(isDefault: Bool, pokemon: flavorText) {
        self.isDefault = isDefault
        self.pokemon = pokemon
    }
}
