//
//  ViewController.swift
//  AnimationsSwift
//
//  Created by leonardo hernandez on 12/21/18.
//  Copyright © 2018 leonardo hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var facePicture: UIImageView!
    
   
    @IBAction func animateAction(_ sender: UIButton) {
        
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "position")
        //valor inicial de la animacion
        animation.fromValue = NSValue(cgPoint: CGPoint(x: facePicture.frame.midX, y: facePicture.frame.midY))
        //especificamos el valor y para que la animacion tome esta posicion
        animation.toValue = NSValue(cgPoint: CGPoint(x: facePicture.frame.midX, y: 640))
        //la animación comience lentamente y luego se acelere a medida que avanza
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.duration = 1.0
        //agregamos la animacion a la imagen
        facePicture.layer.add(animation, forKey: "position")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

