//
//  KiesCategorieViewController.swift
//  LaFonderie
//
//  Created by Gunnar Hemmeryckx on 24/05/18.
//  Copyright © 2018 Gunnar Hemmeryckx. All rights reserved.
//

import UIKit

class KiesCategorieViewController: UIViewController {

    
//    var ref: DatabaseReference!
    let borderAlpha : CGFloat = 0.7
    let cornerRadius : CGFloat = 10

    
//    @IBOutlet weak var metaalbutton: UIButton!
//    @IBOutlet weak var voedingbutton: UIButton!
//    @IBOutlet weak var textielbutton: UIButton!
//    @IBOutlet weak var houtbutton: UIButton!
    
    @IBOutlet var categorieenButtons: [UIButton]!
    
    
    
    @IBAction func pushthebutton(_ sender: UIButton) {

        if (sender == categorieenButtons[0]) {
            categorieenButtons[0].setImage(UIImage(named: "IconMetaalBlauw.png"), for: UIControlState.normal)
        } else if (sender == categorieenButtons[1]){
            categorieenButtons[1].setImage(UIImage(named: "IconVoedingGroen.png"), for: UIControlState.normal)
        }else if (sender == categorieenButtons[2]){
            categorieenButtons[2].setImage(UIImage(named: "IconTextielOranje.png"), for: UIControlState.normal)
        }else if (sender == categorieenButtons[3]){
            categorieenButtons[3].setImage(UIImage(named: "IconHoutRood.png"), for: UIControlState.normal)
        }
        if (sender != categorieenButtons[0]) {
            categorieenButtons[0].setImage(UIImage(named: "IconMetaalWit.png"), for: UIControlState.normal)
        }
        if (sender != categorieenButtons[1]){
            categorieenButtons[1].setImage(UIImage(named: "IconVoedingWit.png"), for: UIControlState.normal)
        }
        if (sender != categorieenButtons[2]){
            categorieenButtons[2].setImage(UIImage(named: "IconTextielWit.png"), for: UIControlState.normal)
        }
        if (sender != categorieenButtons[3]){
            categorieenButtons[3].setImage(UIImage(named: "IconHoutWit.png"), for: UIControlState.normal)
        }
        sender.backgroundColor = UIColor.white
       
        for mijnbuttons in categorieenButtons {
            if (mijnbuttons != sender){
                mijnbuttons.backgroundColor = UIColor.clear
                
                
            }
            
        }
       
    }
    
    override func viewDidLoad() {
        categorieenButtons[0].setImage(UIImage(named: "IconMetaalWit.png"), for: UIControlState.normal)
        categorieenButtons[1].setImage(UIImage(named: "IconVoedingWit.png"), for: UIControlState.normal)
        categorieenButtons[2].setImage(UIImage(named: "IconTextielWit.png"), for: UIControlState.normal)
        categorieenButtons[3].setImage(UIImage(named: "IconHoutWit.png"), for: UIControlState.normal)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        self.ref = Database.database().reference()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension UIButton {
    open override func draw(_ rect: CGRect) {
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 10
        //provide custom style
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .center
        self.imageView?.contentMode = .scaleAspectFit
        
        
    }
}
