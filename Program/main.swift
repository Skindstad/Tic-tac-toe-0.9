//
//  main.swift
//  Program
//
//  Created by elev on 02/05/2018.
//  Copyright © 2018 elev. All rights reserved.
//

import Foundation

print("Hello, World!")

// dette er hvad der laver pladen

class State {
    var table: [[Character]]
    let depth: Int
    let utility: Int
    var value: Int
    
    init(table: [[Character]], depth: Int, utility: Int) {
        self.table = table
        self.depth = depth
        self.utility = utility
        self.value = -999
    }
    
    func prettyPrint() {
        for i in 0..<3 {
            print("+---+---+---+")
            for j in 0..<3 {
                print("| \(table[i][j]) ", terminator: "")
            }
            print("|")
        }
        print("+---+---+---+")
    }
    
}


// en function så til X og O som du skal valge imellem
func readCharacterFromUser() -> Character? {
    
    print("\nPick your weapon!\nPress (O) for Circle\t Press (X) for Cross: ", terminator:"")
    
    if let userInput = readLine(strippingNewline: true) {
        if userInput == "O" {
            return "O"
        }
        if userInput == "X" {
            return "X"
        }
        
        return nil
    } else {
        print("Something went horribily wrong while reading your input")
        exit(1)
    }
}
// det er code som kan hvis hvor jeg har brugt
enum Turn {
    case human
    case computer
}

let emptyChar: Character = " "

let initialGameTable = Array(repeating: Array(repeating: emptyChar, count: 3), count: 3)

var game = State(table: initialGameTable, depth: 0, utility: 0)

var humanSymbol: Character
var computerSymbol: Character

//---Parse which Char Symbol the user inputed and deduce the Char for the Computer from it---//
var charFromUser: Character?

repeat {
    charFromUser = readCharacterFromUser()
} while charFromUser == nil

humanSymbol = charFromUser!

if charFromUser == "O" {
    humanSymbol = "O"
    computerSymbol = "X"
} else {
    humanSymbol = "X"
    computerSymbol = "O"
}
// valger om

func readWhoGoesFirst() -> Character? {
    
    print("\nPick who goes first.\nPress (C) for Computer\t Press (P) for Player: ", terminator:"")
    
    if let userInput = readLine(strippingNewline: true) {
        if userInput == "C" {
            return "C"
        }
        if userInput == "P" {
            return "P"
        }
        
        return nil
    } else {
        print("Something went horribily wrong while reading your input")
        exit(1)
    }
}

var goesFirst = readWhoGoesFirst()
while goesFirst == nil {
    goesFirst = readWhoGoesFirst()
}

var whosTurn: Turn

if goesFirst == "P" {
    whosTurn = Turn.human
} else {
    whosTurn = Turn.computer
}


/* den læser hvor du ville pladser som du har valgt
 det svære fik jeg ikke tid til at lave computer til at give sit trak.
 og du kan eller ikke afslute spille den function noget jeg heller ikke.
 
 
 */
var choise = 0
while true {
    //while true {
    
    print()
    game.prettyPrint()
    print()
    
    print("Make choise");
    if let userChoise = Int(readLine()!){
        choise = userChoise;
        let userChoise2 = Int(readLine()!)!;
        game.table[userChoise][userChoise2] = whosTurn == .human ? humanSymbol : computerSymbol;
        
        if whosTurn == .human {
            whosTurn = .computer
        } else {
            whosTurn = .human
        }
    }
    
    
}
/* Hvis jeg hade mere tid.
 ville jeg have lage at computeren kan give nogle trak.
 jeg ville gøre at du kunne vinde og tabe
 og lave at du kan se hvad du skal skrive
 */
