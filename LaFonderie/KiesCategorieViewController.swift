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

    
    @IBOutlet weak var metaalbutton: UIButton!
    @IBOutlet weak var voedingbutton: UIButton!
    @IBOutlet weak var textielbutton: UIButton!
    @IBOutlet weak var houtbutton: UIButton!
    
    
    @IBAction func pushthebutton(_ sender: UIButton) {

        if (sender == metaalbutton) {
            metaalbutton.setImage(UIImage(named: "IconMetaalBlauw.png"), for: UIControlState.normal)
        } else if (sender == voedingbutton){
            voedingbutton.setImage(UIImage(named: "IconVoedingGroen.png"), for: UIControlState.normal)
        }else if (sender == textielbutton){
            textielbutton.setImage(UIImage(named: "IconTextielOranje.png"), for: UIControlState.normal)
        }else if (sender == houtbutton){

            houtbutton.setImage(UIImage(named: "IconHoutRood.png"), for: UIControlState.normal)
        }
        sender.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        metaalbutton.setImage(UIImage(named: "IconMetaalWit.png"), for: UIControlState.normal)
        voedingbutton.setImage(UIImage(named: "IconVoedingWit.png"), for: UIControlState.normal)
        textielbutton.setImage(UIImage(named: "IconTextielWit.png"), for: UIControlState.normal)
        houtbutton.setImage(UIImage(named: "IconHoutWit.png"), for: UIControlState.normal)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        self.ref = Database.database().reference()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

