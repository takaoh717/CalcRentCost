//
//  ViewController.swift
//  CalcRentCost
//
//  Created by Takao Horiguchi on 2019/12/06.
//  Copyright © 2019 Takao Horiguchi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var regularCostTextField: UITextField!
    @IBOutlet weak var manageCostTextField: UITextField!
    @IBOutlet weak var rentCostTextField: UITextField!
    @IBOutlet weak var keyMoneyTextField: UITextField!
    @IBOutlet weak var insuranceTextField: UITextField!
    @IBOutlet weak var securityCostTextField: UITextField!
    @IBOutlet weak var changeKeyTextField: UITextField!
    @IBOutlet weak var cleaningTextField: UITextField!
    @IBOutlet weak var feeTextField: UITextField!
    @IBOutlet weak var otherTextField: UITextField!
    
    @IBOutlet weak var totalCostLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    var totalCost = 0 {
        didSet {
            var str = "合計：\(totalCost)円"
            if totalCost > 10000 {
                let index = str.index(str.endIndex, offsetBy: -4)
                str.insert(",", at: index)
            }
            if totalCost > 1000000 {
                let index = str.index(str.endIndex, offsetBy: -8)
                str.insert(",", at: index)
            }

            totalCostLabel.text = str
        }
    }
    
    func refreshCost() {
        var total = 0
        
        if let cost = Int(regularCostTextField.text ?? "0") {
            total += (cost * 24)
        }
        
        if let cost = Int(manageCostTextField.text ?? "0") {
            total += (cost * 24)
        }
        
        total += Int(manageCostTextField.text ?? "0") ?? 0
        total += Int(rentCostTextField.text ?? "0") ?? 0
        total += Int(keyMoneyTextField.text ?? "0") ?? 0
        total += Int(insuranceTextField.text ?? "0") ?? 0
        total += Int(securityCostTextField.text ?? "0") ?? 0
        total += Int(changeKeyTextField.text ?? "0") ?? 0
        total += Int(cleaningTextField.text ?? "0") ?? 0
        total += Int(feeTextField.text ?? "0") ?? 0
        total += Int(otherTextField.text ?? "0") ?? 0
        
        totalCost = total
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regularCostTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)
        
        manageCostTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)

        rentCostTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)

        keyMoneyTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)

        insuranceTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)

        securityCostTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)

        changeKeyTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)

        cleaningTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)

        feeTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)

        otherTextField.rx.text.asDriver().drive(onNext: { (text) in
            self.refreshCost()
        }).disposed(by: disposeBag)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
