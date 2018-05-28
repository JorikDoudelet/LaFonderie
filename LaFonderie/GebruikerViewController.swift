//
//  GebruikerViewController.swift
//  LaFonderie
//
//  Created by Gunnar Hemmeryckx on 25/05/18.
//  Copyright © 2018 Gunnar Hemmeryckx. All rights reserved.
//

import UIKit
import FirebaseDatabase

class GebruikerViewController: UIViewController {
    
    var ref: DatabaseReference!
    let borderAlpha : CGFloat = 0.7
    let cornerRadius : CGFloat = 10
    
    @IBOutlet weak var txtGebruikernaam: UITextField!
    
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
//        sender.layer.borderWidth = 2.0
//        sender.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
//        sender.layer.cornerRadius = cornerRadius
        
    }
    
    override func viewDidLoad() {
        
        
//        metaalbutton.contentMode = .center
//        metaalbutton.imageView?.contentMode = .scaleAspectFit
        
        metaalbutton.setImage(UIImage(named: "IconMetaalWit.png"), for: UIControlState.normal)
        voedingbutton.setImage(UIImage(named: "IconVoedingWit.png"), for: UIControlState.normal)
         textielbutton.setImage(UIImage(named: "IconTextielWit.png"), for: UIControlState.normal)
         houtbutton.setImage(UIImage(named: "IconHoutWit.png"), for: UIControlState.normal)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.ref = Database.database().reference()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "naarCategorie"
//        {
//            let persoon = [
//                "gebruikersnaam":  txtGebruikernaam.text ?? <#default value#>,
//                "totaalPunten": 0
//            ] as [String : Any]
//
//            self.ref.child("Persoon").childByAutoId().setValue(persoon)
//            if segue.destination is KiesCategorieViewController {
//            }
//        }
    }
    

}
