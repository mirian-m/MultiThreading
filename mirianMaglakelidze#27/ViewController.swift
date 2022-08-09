//
//  ViewController.swift
//  mirianMaglakelidze#27
//
//  Created by Admin on 8/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculateBtn: UIButton! {
        didSet {
            calculateBtn.setTitle("Calculate Prime Numbers", for: .normal)
        }
    }
    @IBOutlet weak var dataPicker: UIDatePicker!
    let numberRange = 100000

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calculateBtnAction(_ sender: Any) {
        
        // Make calculating on background thread
        DispatchQueue.global(qos: .background).sync { [weak self] in
            self?.calculateBtn.setTitle("calculating...", for: .normal)
            self?.calculateBtn.isEnabled = false
            self?.printPrimeNumber()
        }
    }
    @IBAction func pickerAction(_ sender: Any) {}
    
    func printPrimeNumber() {
        DispatchQueue.global(qos: .background).async {
            for number in 1...self.numberRange {
                if self.isnNumberPrime(number) {
                    print(number)
                }
            }
            // Switch to main thread and change button enable
            DispatchQueue.main.async { [weak self] in
                self?.calculateBtn.setTitle("Calculate Prime Numbers", for: .normal)
                self?.calculateBtn.isEnabled = true
            }
        }
    }
    func isnNumberPrime(_ number: Int) -> Bool {
        if number == 2 {
            return true
        } else if number < 2 {
            return false
        } else {
            for i in 3..<number {
                if number.isMultiple(of: i) {
                    return false
                }
            }
        }
        return true
    }
}

