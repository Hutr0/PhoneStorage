//
//  AlertManager.swift
//  PhoneStorage
//
//  Created by Леонид Лукашевич on 27.09.2022.
//

import UIKit

class AlertManager {
    
    static func showAlertWithTwoFields(s: ViewController, title: String?, message: String?, compltion: @escaping ([String]) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField() { tf in
            tf.placeholder = "IMEI"
        }
        
        alert.addTextField() { tf in
            tf.placeholder = "Model"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let imei = alert.textFields![0] as UITextField
            let model = alert.textFields![1] as UITextField
            
            guard let imeiText = imei.text, let modelText = model.text else { return }
            compltion([imeiText, modelText])
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        s.present(alert, animated: true)
    }
}
