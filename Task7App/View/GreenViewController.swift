//
//  GreenViewController.swift
//  Task7App
//
//  Created by 山崎喜代志 on 2021/03/25.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet private weak var topTextField: UITextField!
    @IBOutlet private weak var bottomTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    private let calculatorModel = CalculatorModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorModel.delegate = self
        topTextField.keyboardType = .numberPad
        bottomTextField.keyboardType = .numberPad
    }

    @IBAction private func calculateAction(_ sender: Any) {
        let num1 = Int(topTextField.text ?? "") ?? 0
        let num2 = Int(bottomTextField.text ?? "") ?? 0
        calculatorModel.plusCalculate(num1: num1, num2: num2)

        topTextField.resignFirstResponder()
        bottomTextField.resignFirstResponder()
    }

}

extension GreenViewController: CalculatorModelDelegate {
    func didUpdateTotal(total: Int) {
        DispatchQueue.main.async { [weak self] in
                    self?.resultLabel.text = String(total)
    }
  }
}
