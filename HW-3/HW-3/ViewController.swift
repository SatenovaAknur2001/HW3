//
//  ViewController.swift
//  HW-3
//
//  Created by Акнур on 3/8/20.
//  Copyright © 2020 Акнур. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    @objc func presentView() {
          
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyboard.instantiateViewController(identifier: "parametresView") as FigureCreaterViewController
          
          vc.onSelect = { [weak self] width, height, x, y, color in
              guard let self = self else {return}
              
              let newView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
              
              let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.viewDidTap))
              newView.addGestureRecognizer(tapGestureRecognizer)
              
              let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.viewDidPan(recognizer:)))
              newView.addGestureRecognizer(panGestureRecognizer)
              
              let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.viewDidPinch))
              newView.addGestureRecognizer(pinchGestureRecognizer)
              
              newView.backgroundColor = color
              self.view.addSubview(newView)
          }
          
          navigationController?.pushViewController(vc, animated: true)
          
      }
    var baseOrigin: CGPoint!
       @objc func pan(recognizer: UIPanGestureRecognizer) {
           if let coordinates = recognizer.view {
               switch recognizer.state {
               case .began:
                   baseOrigin = coordinates.frame.origin
               case .changed:
                   let d = recognizer.translation(in: coordinates)
                   coordinates.frame.origin.x = baseOrigin.x + d.x
                   coordinates.frame.origin.y = baseOrigin.y + d.y
               default: break
               }
           }
       }

}

