//
//  PinkViewController.swift
//  Task7App
//
//  Created by 山崎喜代志 on 2021/03/25.
//

import UIKit

class PinkViewController: UIViewController {

    @IBOutlet private weak var topTextField: UITextField!
    @IBOutlet private weak var bottomTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    private var resultNum: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateresultLabel()
        topTextField.keyboardType = .numberPad
        bottomTextField.keyboardType = .numberPad
    }

    private func updateResultNum(num1: Int, num2: Int) {
        resultNum = CalculatorModel.plusCalculate(num1: num1, num2: num2)
    }

    private func updateresultLabel() {
        resultLabel.text = String(resultNum)
    }

    @IBAction private func calculateAction(_ sender: Any) {
        let num1 = Int(topTextField.text ?? "") ?? 0
        let num2 = Int(bottomTextField.text ?? "") ?? 0
        updateResultNum(num1: num1, num2: num2)
        updateresultLabel()

        topTextField.resignFirstResponder()
        bottomTextField.resignFirstResponder()
    }
}
