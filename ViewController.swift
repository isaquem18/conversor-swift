//
//  ViewController.swift
//  conversor-de-medidas_swift
//
//  Created by Isaque Moura on 31/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        btUnitTwo.alpha = 0.3
        lbResultUnit.text = "Farenheit"
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    
    @IBOutlet var btUnitOne: UIButton!
    @IBOutlet var btUnitTwo: UIButton!
    
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
            
    @IBAction func showNext(_ sender: UIButton) {
        switch headLabel.text! {
            case "Temperatura":
                headLabel.text = "Peso"
                btUnitOne.setAttributedTitle(NSAttributedString(string: "Kilograma"), for: .normal)
                btUnitTwo.setAttributedTitle(NSAttributedString(string: "Libra"), for: .normal)
            case "Peso":
                headLabel.text = "Moeda"
                btUnitOne.setAttributedTitle(NSAttributedString(string: "Real"), for: .normal)
                btUnitTwo.setAttributedTitle(NSAttributedString(string: "Dólar"), for: .normal)
            case "Moeda":
                headLabel.text = "Distância"
                btUnitOne.setAttributedTitle(NSAttributedString(string: "Metro"), for: .normal)
                btUnitTwo.setAttributedTitle(NSAttributedString(string: "kilômetro"), for: .normal)
            default:
                headLabel.text = "Temperatura"
                btUnitOne.setAttributedTitle(NSAttributedString(string: "Celsius"), for: .normal)
                btUnitTwo.setAttributedTitle(NSAttributedString(string: "Farenheit"), for: .normal)
        }
        
        convert(nil)
    }
    
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnitOne {
                btUnitTwo.alpha = 0.3
            } else {
                btUnitOne.alpha = 0.3
            }
            sender.alpha = 1
        }
        
        switch headLabel.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
    }
    
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else { return }
        
        if (btUnitOne.alpha == 1.0) {
            lbResultUnit.text = "Farenheit"
            lbResult.text = String(temperature * 1.8 + 32.0)
        } else {
            lbResultUnit.text = "Celsius"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else { return }
        
        if (btUnitOne.alpha == 1.0) {
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(weight / 2.2046)
        } else {
            lbResultUnit.text = "Libra"
            lbResult.text = String(weight * 2.2046)
        }
    }
    
    func calcCurrency() {
        guard let currency = Double(tfValue.text!) else { return }
        
        if (btUnitOne.alpha == 1.0) {
            lbResultUnit.text = "Dólar"
            lbResult.text = String(currency / 5.5)
        } else {
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 5.5)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else { return }
        
        if (btUnitOne.alpha == 1.0) {
            lbResultUnit.text = "Kilômetro"
            lbResult.text = String(distance / 1000)
        } else {
            lbResultUnit.text = "Metros"
            lbResult.text = String(distance * 1000)
        }
    }
    
    
    
}

