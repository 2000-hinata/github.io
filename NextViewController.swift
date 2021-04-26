//
//  NextViewController.swift
//  SampleTableView
//
//  Created by 松田陽尚 on 2021/04/21.
//
protocol SetDelegate {
    func set(check:Acount)
}
import UIKit

class NextViewController: UIViewController {

    var acount = Acount()
    var setDelegate:SetDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var moneyTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyTextField.text = "0"

    }
    

    @IBAction func done(_ sender: Any) {
        acount.name = nameTextField.text!
        acount.money = Int(moneyTextField.text!)!
        setDelegate?.set(check: acount)
        dismiss(animated: true, completion: nil)
    }

}
