//
//  ViewController.swift
//  SampleTableView
//
//  Created by 松田陽尚 on 2021/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SetDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    var acount = Acount()
    var acountArray = [Acount]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "cell")
        textField.text = "0"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acountArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerCell
        cell.moneyLabel.text = String(acountArray[indexPath.row].money)
        cell.nameLabel.text = acountArray[indexPath.row].name
        cell.button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        cell.button.tag = indexPath.row
        cell.dicButton.addTarget(self, action: #selector(tapDicButton), for: .touchUpInside)
        cell.dicButton.tag = indexPath.row
        return cell
    }
    
    @objc func tapButton(_ sender: UIButton){
        let kakemoney = Int(textField.text!)
        acount.change(kake: kakemoney!)
        print(acountArray[sender.tag].money)
        acountArray[sender.tag].money += acount.kakemoney
        print(acount.kakemoney)
        print(acountArray[sender.tag].money)
        tableView.reloadData()
        acount.kakemoney -= Int(kakemoney!)
    }
    
    @objc func tapDicButton(_ sender: UIButton){
        let kakemoney = Int(textField.text!)
        acount.change(kake: kakemoney!)
        print(acountArray[sender.tag].money)
        acountArray[sender.tag].money -= acount.kakemoney
        print(acount.kakemoney)
        print(acountArray[sender.tag].money)
        tableView.reloadData()
        acount.kakemoney -= Int(kakemoney!)
    }
    
    
    func set(check: Acount) {
        acountArray.append(check)
        tableView.reloadData()
    }

    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            nextVC.setDelegate = self
        }
    }

    
}

