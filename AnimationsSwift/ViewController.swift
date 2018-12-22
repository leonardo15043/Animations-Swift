//
//  ViewController.swift
//  AnimationsSwift
//
//  Created by leonardo hernandez on 12/21/18.
//  Copyright © 2018 leonardo hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @objc var state = true
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
    
    

    @IBAction func crushAnimation(_ sender: UIButton) {
        
        if(state){
            //cambiamos de tamaño
            let resizeAnimation:CABasicAnimation = CABasicAnimation(keyPath:"bounds.size")
            resizeAnimation.toValue = NSValue(cgSize:CGSize(width: 240, height: 60))
            resizeAnimation.fillMode = CAMediaTimingFillMode.forwards
            resizeAnimation.isRemovedOnCompletion = false
            facePicture.layer.add(resizeAnimation, forKey: "bounds.size")
            
            state = false
            
        }else{

            let resizeAnimation:CABasicAnimation = CABasicAnimation(keyPath:"bounds.size")
            resizeAnimation.toValue = NSValue(cgSize:CGSize(width: 340, height: 120))
            resizeAnimation.fillMode = CAMediaTimingFillMode.forwards
            resizeAnimation.isRemovedOnCompletion = false
            facePicture.layer.add(resizeAnimation, forKey: "bounds.size")
            
            state = true
            
        }
    }
    
    
    @IBAction func transparentAnimation(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1.0, animations:{
            self.facePicture.alpha = 0.0
        }, completion: {(value: Bool) in
            self.facePicture.alpha = 1.0
        })
        
    }
    
    @IBAction func curveAnimation(_ sender: UIButton) {
        
        let subLayer : CALayer = self.facePicture.layer
        let thePath : CGMutablePath = CGMutablePath();
        
        thePath.move(
            to: CGPoint(x: 0, y: 500) //Start point
        )
        thePath.addCurve(
            to: CGPoint(x: 300, y: 500), //Endpoint
            control1: CGPoint(x: 100, y: 200), //Control point 1
            control2: CGPoint(x: 200, y: 700) //Control point 2
        );
        
        let theAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath:"position")
        theAnimation.path = thePath
        theAnimation.duration = 5.0
        theAnimation.fillMode = CAMediaTimingFillMode.forwards
        theAnimation.isRemovedOnCompletion = false
        
        subLayer.add(theAnimation, forKey: "position")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

