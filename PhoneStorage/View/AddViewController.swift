//
//  AddViewController.swift
//  PhoneStorage
//
//  Created by Леонид Лукашевич on 29.09.2022.
//

import UIKit

class AddViewController: UIViewController {
    
    var mobile = Mobile(imei: "", model: "")

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var modelTF: UITextField!
    @IBOutlet weak var imeiTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateAddButtonState()
    }
    
    private func updateAddButtonState() {
        let imei = imeiTF.text ?? ""
        let model = modelTF.text ?? ""
        
        addButton.isEnabled = !imei.isEmpty && !model.isEmpty
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateAddButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "addSegue" else { return }
        
        let imei = imeiTF.text ?? ""
        let model = modelTF.text ?? ""
        
        self.mobile = Mobile(imei: imei, model: model)
    }
}
