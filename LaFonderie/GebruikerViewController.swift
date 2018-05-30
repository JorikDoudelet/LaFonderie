//
//  GebruikerViewController.swift
//  LaFonderie
//
//  Created by Gunnar Hemmeryckx on 25/05/18.
//  Copyright © 2018 Gunnar Hemmeryckx. All rights reserved.
//

import UIKit
import FirebaseDatabase
import CoreData
class GebruikerViewController: UIViewController {
    let userDefault = UserDefaults.standard
    //let gebruikersScore = UserDefaults.standard
    //let avatarNaam = UserDefaults.standard
    var ref: DatabaseReference!
    var isSolo:Bool = false
    var selectedAvatar:String = ""
    @IBOutlet weak var txtGebruikernaam: UITextField!
    @IBOutlet var avatarButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        for button in avatarButtons{
            button.backgroundColor = .clear
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor =  UIColor.white.cgColor
            button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        }
        
        self.ref = Database.database().reference()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func avatarSelected(_ sender: Any)
    {
        let tappedButton = sender as! UIButton
        
        tappedButton.backgroundColor = UIColor.white
        tappedButton.isSelected = true
        selectedAvatar = tappedButton.currentTitle!
        for button in avatarButtons{
            if(button != tappedButton){
                button.backgroundColor = UIColor.clear
                button.isSelected = false
            }
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "naarCategorie"
        {
            /*let persoon = [
                "gebruikersnaam":  txtGebruikernaam.text,
                "totaalPunten": 0,
                "Scores": ["metaalTotaal":0,"houtTotaal":0,"textielTotaal":0,"voedingTotaal":0]
                ] as [String : Any]
            
            self.ref.child("Persoon").childByAutoId().setValue(persoon)*/
            if let destinationVC = segue.destination as? KiesCategorieViewController {
                if(isSolo){
                    userDefault.set(txtGebruikernaam.text, forKey: "Gebruikersnaam")
                    userDefault.set(self.selectedAvatar, forKey: "AvatarNaam")
                    userDefault.set(0, forKey: "GebruikerScore")
                }
            }
        }
    }
    
    
}
