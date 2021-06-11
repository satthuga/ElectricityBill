//
//  ViewController.swift
//  ElectricityBill
//
//  Created by Apple on 11/06/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var elecTextField: UITextField!
    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        elecTextField.placeholder = "Nhập số điện (kWh)"
        elecTextField.borderStyle = .roundedRect
        elecTextField.keyboardType = .numberPad
        
        myButton.layer.cornerRadius = 18
        myButton.setTitle("Tính", for: .normal)
        
        moneyLabel.text = ""
        
    }
    
    @IBAction func onPress(_ sender: Any) {
        guard let elecNumber = elecTextField.text else {
            return
        }
        
        switch Double(elecNumber) ?? -1 {
        case 0...50:
            moneyLabel.text = String(Double(elecNumber)! * 1.678)
        case 51...100:
            moneyLabel.text = String(50*1.678 + (Double(elecNumber)! - 50)*1.734)
        case 101...200:
            moneyLabel.text = String(50*1.678 + 50*1.734 + (Double(elecNumber)! - 100)*2.014)
        case 201...300:
            moneyLabel.text = String(50*1.678 + 50*1.734 + 100*2.014 + (Double(elecNumber)! - 200)*2.536)
        case 301...400:
            moneyLabel.text = String(50*1.678 + 50*1.734 + 100*2.014 + 100*2.536 + (Double(elecNumber)! - 300)*2.834)
        case 401... :
            moneyLabel.text = String(909 + (Double(elecNumber)! - 400)*2.927)
        default:
            moneyLabel.text = "Số điện không hợp lệ"
        }
    }
    
}

