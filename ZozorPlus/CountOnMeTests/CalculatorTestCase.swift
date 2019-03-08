//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by BOUHADEB Yacoub on 22/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorTestCase: XCTestCase {
// messge d'erreur
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    func testGivenCalculTotaleIsNulWhenOpertationThenResultat() {
        calculator.stringNumbers = [""]
        let  a = calculator.calculateTotal()
        XCTAssert(a == 0)
    }
    
    func testGivenCalculTotaleIsNulWhenOpertationAddThenResult() {
        calculator.stringNumbers = ["1"]
        calculator.operators.append("+")
        calculator.stringNumbers.append("")
        calculator.addNewNumber(1)
        
        let  a = calculator.calculateTotal()
        XCTAssert(a == 2)
    }
    
   func testGivenCalculTotaleIsNulWhenOpertationMinusThenResult() {
        calculator.stringNumbers = ["1"]
        calculator.operators.append("-")
        calculator.stringNumbers.append("")
        calculator.addNewNumber(1)

        let  a = calculator.calculateTotal()
        XCTAssert(a == 0)
    }
    
    func testGivenStringNumbersCountHasEmptyStringWhenAddNumberIsTriggeredThenSendsFalse() {
        calculator.stringNumbers = [""]
        
        XCTAssertFalse(calculator.canAddOperator)
    }
    
    func testGivenStringNumbersIsNotEmptyWhenAddNumberIsTriggeredThenSendsTrue() {
        
        calculator.stringNumbers = ["1"]
        
        XCTAssertTrue(calculator.canAddOperator)
    }
    
    func testGivenStringNumberNullWhenAddNumberThenNoNull() {
        
        calculator.addNewNumber(1)
        
        XCTAssert(calculator.stringNumbers == ["1"])
    }
    
    func testGivenStringNumbersIsEmpty_whenisExpressionCorrectTriggered_thenSendsFalse() {

        calculator.stringNumbers = [String()]
        
        XCTAssertFalse(calculator.isExpressionCorrect)
    }
    
    func testGivenStringNumbersIsEmpty_whenisExpressionCorrectTriggeredThenSendsTrue() {
        
        calculator.stringNumbers = ["1"]
        
        XCTAssertTrue(calculator.isExpressionCorrect)
    }
    
    func testGivenNumberIsEmpty_WhenPressNumber_thenStackNumberAppendNewNumber() {
        calculator.stringNumbers = [""]
        calculator.addNewNumber(1)
        
        XCTAssert(calculator.stringNumbers == ["1"])
    }
    
    func testGivenNumberIsPopulated_WhenPressNumber_thenStackNumberAppendNewNumber() {
        calculator.stringNumbers = ["1"]
        calculator.addNewNumber(1)
        
        XCTAssert(calculator.stringNumbers == ["11"])
    }

    func testGivenIsNullWhenOperationNoNullThenClearIsNull () {
        calculator.stringNumbers[0] = "123"
        calculator.operators = ["-"]
        calculator.clear()
        XCTAssert(calculator.stringNumbers == [String()] && calculator.operators[0] == "+")
    }
    
    func testGivenTextNullWhenOperationThenDisplayValidfText() {
        calculator.stringNumbers = ["40"]
        calculator.operators.append("+")
        calculator.stringNumbers.append("")
        let a = calculator.display()
        XCTAssert(a == "40+")
    }
    
    func testGivenclearWhenNoErrorThenThrowClear() {
       calculator.stringNumbers = ["42"]
        try! calculator.total()
        XCTAssertEqual(calculator.stringNumbers, [String()])
        XCTAssertEqual(calculator.operators, ["+"])
        
    }
    
    func testGivenclearWhenErrorThenThrowError() {
        calculator.stringNumbers = [""]
        var error = false
        do {
            try calculator.total()
        } catch ErrorMessage.cantTotal {
            error = true
        } catch {
            print("error")
        }
        XCTAssert(error)
    }
    
    func testGivencanAddOpertorWhenTestcanAddThenAddOperator() {
        calculator.stringNumbers = ["42"]
        XCTAssert(calculator.operators == ["+"])
        try! calculator.addNewOperator(newOperator: "-")
        XCTAssert(calculator.operators[1] == "-")
        XCTAssert(calculator.stringNumbers[1] == "")
    }
    
    func testGivencanAddOpertorWhenTestcanAddThenError () {
        calculator.stringNumbers = [""]
        let newOperator = "+"
        var error = false
        do {
            try calculator.addNewOperator(newOperator: newOperator)
        }  catch ErrorMessage.cantAdd {
            error = true
        }  catch {
            print("error")
        }
        XCTAssert(error)
    }
    
    func testGivencanMinusOpertorWhenTestcanMinusThenError () {
        calculator.stringNumbers = [""]
        let newOperator = "-"
        var error = false
        do {
            try calculator.addNewOperator(newOperator: newOperator)
        }  catch ErrorMessage.cantMinus {
            error = true
        }  catch {
            print("error")
        }
        XCTAssert(error)
    }
   /* func addNewOperator(newOperator: String) throws {
        guard canAddOperator else {
            if newOperator == "+" {
                throw ErrorMessage.cantAdd
            } else {
                throw ErrorMessage.cantMinus
            }
        }
        operators.append(newOperator)
        stringNumbers.append("")
    }*/
}

