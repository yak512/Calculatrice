//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    // Instanciate Model
    
    var calculator = Calculator()
    

    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    
    // ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                calculator.addNewNumber(i)
                let text = calculator.display()
                textView.text = text
                
            }
        }
    }
    
    @IBAction func plus() {
        do {
            try calculator.addNewOperator(newOperator: "+")
            textView.text = calculator.display()
        } catch ErrorMessage.cantAdd {
            showAlert("Vous ne pouvez pas utiliser l'operateur +")
        } catch {
            showAlert("Erreur")
        }
    }

    @IBAction func minus() {
        do {
            try calculator.addNewOperator(newOperator: "-")
            textView.text = calculator.display()
        } catch ErrorMessage.cantMinus {
            showAlert("Vous ne pouvez pas utiliser l'operateur -")
        } catch {
            showAlert("Erreur")
        }
    }

    @IBAction func equal() {
        do {
            try calculator.total()
            let total = calculator.calculateTotal()
            calculator.clear()
            textView.text = textView.text + "=\(total)"
        } catch ErrorMessage.cantTotal {
            showAlert("Vous ne pouvez pas faire cette action, veuillez taper un nouveau calcul")
        } catch {
            showAlert("Erreur")
        }
    }


    // MARK: - Methods
    
    func showAlert(_ message: String) {
        // instantiate alertController
        textView.shake()
        let alertVC = UIAlertController(title: "Erreur!", message: message, preferredStyle: .alert)
        // add cancel button
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

// MARK: BONUS

extension UITextView {
    
    func shake() {
        let shake = CASpringAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 3
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 10, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 10, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue

        
        layer.add(shake, forKey: nil)
    }
}
