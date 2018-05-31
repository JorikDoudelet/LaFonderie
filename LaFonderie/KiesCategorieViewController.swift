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
    var categorieNaam:String = ""
    var themaCounter = 0
    var themaArray = [String]()
    let aantalThemasGespeeld = UserDefaults.standard
//    @IBOutlet weak var metaalbutton: UIButton!
//    @IBOutlet weak var voedingbutton: UIButton!
//    @IBOutlet weak var textielbutton: UIButton!
//    @IBOutlet weak var houtbutton: UIButton!
    
    @IBOutlet var categorieenButtons: [UIButton]!

    @IBAction func pushthebutton(_ sender: UIButton) {
        sender.isSelected = true
        if (sender == categorieenButtons[0]) {
            categorieenButtons[0].setImage(UIImage(named: "IconMetaalBlauw.png"), for: UIControlState.normal)
            categorieNaam = "Metaal"
        } else if (sender == categorieenButtons[1]){
            categorieenButtons[1].setImage(UIImage(named: "IconVoedingGroen.png"), for: UIControlState.normal)
            categorieNaam = "Voeding"
        }else if (sender == categorieenButtons[2]){
            categorieenButtons[2].setImage(UIImage(named: "IconTextielOranje.png"), for: UIControlState.normal)
            categorieNaam = "Textiel"
        }else if (sender == categorieenButtons[3]){
            categorieenButtons[3].setImage(UIImage(named: "IconHoutRood.png"), for: UIControlState.normal)
            categorieNaam = "Hout"
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
                sender.isSelected = false
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
        aantalThemasGespeeld.set(aantalThemasGespeeld.integer(forKey: "aantalThemasGespeeld")+1, forKey: "aantalThemasGespeeld")
        
        for mijnbuttons in categorieenButtons {
            mijnbuttons.layer.cornerRadius = 5
            mijnbuttons.layer.borderWidth = 1
            mijnbuttons.layer.borderColor = UIColor.white.cgColor
            mijnbuttons.clipsToBounds = true
          mijnbuttons.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "naarQuiz"
        {
            if let destinationVC = segue.destination as? TestViewController {
                destinationVC.categorieNaam = categorieNaam
                themaArray.append(categorieNaam)
               // var aantalThemasGespeeld:Int?
               // aantalThemas.set(aantalThemasGespeeld!, forKey: "AantalThemas")
               print("THEMA ARRAY", themaArray)
                destinationVC.themaCounter = UserDefaults.standard.integer(forKey: "aantalThemasGespeeld")
            }
          
        }
      
    }*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "naarQrScanner" {
            
            let mijndestination = segue.destination as! QRReaderViewController
            
            mijndestination.mijncategorie = categorieNaam
        }
        
        
    }
}

