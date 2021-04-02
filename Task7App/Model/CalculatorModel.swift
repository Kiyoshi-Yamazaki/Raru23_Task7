//
//  CalculatorModel.swift
//  Task7App
//
//  Created by 山崎喜代志 on 2021/03/25.
//

import Foundation

protocol CalculatorModelDelegate: AnyObject {
    func didUpdateTotal(total: Int)
}

class CalculatorModel {

    weak var delegate: CalculatorModelDelegate? {
        didSet {
            delegate?.didUpdateTotal(total: total)
        }
    }

    private(set) var total: Int = 0

    func plusCalculate(num1: Int, num2: Int) {
        total = num1 + num2
        delegate?.didUpdateTotal(total: total)
    }
}
