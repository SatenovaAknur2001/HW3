//
//  FigureCreaterViewController.swift
//  HW-3
//
//  Created by Акнур on 3/8/20.
//  Copyright © 2020 Акнур. All rights reserved.
//

import UIKit

class FigureCreaterViewController: UIViewController {
    var color: UIColor?
    var selectedFigure: UIView?
    @IBOutlet weak var textFieldWidth: UITextField!
       @IBOutlet weak var textFieldHeight: UITextField!
       @IBOutlet weak var textFieldX: UITextField!
       @IBOutlet weak var textFieldY: UITextField!
       @IBOutlet weak var redButton: UIButton!
       @IBOutlet weak var tealButton: UIButton!
       @IBOutlet weak var greenButton: UIButton!
       @IBOutlet weak var yellowButton: UIButton!
   
    @IBAction func ChooseColor(_ sender: Any) {
         sender.isSelected = true;
            
            guard let backcolor = sender.backgroundColor else {return}
            color=backcolor
        }
        var onSave:((CGFloat, CGFloat,CGFloat,CGFloat,UIColor)-> Void)? = nil
        
    @IBAction func SaveAll(_ sender: Any) {
        guard let width = textFieldWidth.text, let height = textFieldHeight.text, let x = textFieldX.text, let y = textFieldY.text, let color = color else {
                   let alert = UIAlertController(title: "Error", message: "Fill all data", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   self.present(alert, animated: true)
                   return
    }
    @objc func deleteFigure() {
           guard let figure = selectedFigure else {return}
           figure.removeFromSuperview()
           
           self.navigationController?.popViewController(animated: true)
       }
    
}
}
