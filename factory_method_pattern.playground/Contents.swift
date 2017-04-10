//: Playground - noun: a place where people can play

import UIKit
import Foundation

protocol Card {
    var name: String? {get set}
    var attack: Int? {get set}
    var defense: Int? {get set}
    var mana: Int? {get set}
    
    func clone() -> Card
    func toString() -> String
}

class AbstractCard : NSObject, Card {
    
    var _name: String?
    var _attack: Int?
    var _defense: Int?
    var _mana: Int?
    
    init(name: String?, mana: Int?, attack: Int?, defense: Int?) {
        
        self._name = name
        self._attack = attack
        self._defense = defense
        self._mana = mana
        super.init()
    }
    
    override init() {
        super.init()
    }
    
    // property name
    var name:String? {
        get{return _name}
        set{_name = newValue}
    }
    
    // property mana
    var mana: Int? {
        get{return _mana}
        set{_mana = newValue}
    }
    
    // property attack
    var attack: Int? {
        get{return _attack}
        set{_attack = newValue}
    }
    
    // property defense
    var defense: Int? {
        get{return _defense}
        set{_defense = newValue}
    }
    
    func clone() -> Card {
        return AbstractCard(name: self.name, mana: self.mana, attack: self.attack, defense: self.defense)
    }
    
    func toString() -> String {
        return ("\(self.name, self.mana, self.attack,self.defense)")
    }
}

enum CardType {
    case FacelessManipulator, RaidLeader
}

// our Factory Class
// Depending what we need, this class return an instance of the
// appropriate object.
class CardFactory {
    class func createCard(cardtype: CardType) -> Card? {
        
        switch cardtype {
        
            case .FacelessManipulator:
                return FacelessManipulatorCard()
            
            case .RaidLeader:
                return RaidLeaderCard()
            
            default:
                return nil
        }
    }
}

//Concrete Card "Raid Leader"
//This is the full definition of the Raid Leader Card
class RaidLeaderCard: AbstractCard {
    
    override init() {
        super.init()
        
        self._mana = 3
        self._attack = 2
        self._defense = 2
        self._name = "Raid Leader"
    }
}

//Concrete Card "Faceless Manipulator"
//this is the full definition of the FacelessManipulator Card.
class FacelessManipulatorCard: AbstractCard {
    
    override init() {
        super.init()
        
        self._mana = 5
        self._attack = 3
        self._defense = 3
        self._name = "Faceless Manipulator"
    }
}

//simulate our client

var c = CardFactory.createCard(cardtype:.FacelessManipulator)
c?.toString()
