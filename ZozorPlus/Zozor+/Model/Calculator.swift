//
//  Calculator.swift
//  CountOnMe
//
//  Created by BOUHADEB Yacoub on 22/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculator {
    
    // MARK: Variables
    
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    
    
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }

    // MARK: Fonctions
    
    // Cette fonction permet de rajouter un opérateur "+" ou "-", si il y a une erreure, elle est envoyé
    func addNewOperator(newOperator: String) throws {
        guard canAddOperator else {
            if newOperator == "+" {
                throw ErrorMessage.cantAdd
            } else {
                throw ErrorMessage.cantMinus
            }
        }
        operators.append(newOperator)
        stringNumbers.append("")
    }
    
    // Lorque que le caclcul total présente une erreure, celle-ce est t'envoyé
    func total() throws {
        guard isExpressionCorrect else {
            throw ErrorMessage.cantTotal
        }
    }
    
    // Cette fonction permet de rajouter un numéro, à la variable stringNumber
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count - 1] = stringNumberMutable
        }
    }

    // Cette fonction renvoit le total d'un calcul
    func calculateTotal() -> Int {
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        return total
    }
    
    // Cette fonction renvois une chaine de caractères qui sera ensuite affiché à l'écran
    func display() -> String {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        return text
    }
    
    // Cette fonction permet d'initialiser les variables stringNumbers et oprators, à la fin d'un calcul, pour préparer le calcul suivant
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    
}
