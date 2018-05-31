//
//  TestViewController.swift
//  LaFonderie
//
//  Created by Gunnar Hemmeryckx on 24/05/18.
//  Copyright © 2018 Gunnar Hemmeryckx. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TestViewController: UIViewController {
    
    
    
    @IBOutlet var antwoordButtons: [UIButton]!
    
    //var totaalScore = 0
    var waardePunten = 1
    var metaalScore = 0
    var voedingScore = 0
    var textielScore = 0
    var houtScore = 0
    var themaCounter = 0
    
    var currentQuestion = 0
    var rightAnswerPlace:UInt32 = 0
    var rightAnswer:String = ""
    var categorieNaam:String = "Metaal"
    @IBOutlet weak var lblVraag: UILabel!
    
    
    var ref: DatabaseReference!
    //var antwoordenArray = [String]()
    var antwoordenArray = [[String]]()
    var vragenArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("AANTAL THEMAS", themaCounter)
        self.ref = Database.database().reference()
        let quizVraagRef = self.ref.child("Thema/\(categorieNaam)")
        quizVraagRef.observe(.value) { (snapShot) in
            if let snapshots = snapShot.children.allObjects as? [DataSnapshot] {
                    for child in snapshots {
                        //print("Child: ", child)
                        var temparray =  [String]()
                        var antwoordString:String = ""
                        let vraag = child.childSnapshot(forPath: "vraag").value as! String
                        self.rightAnswer = child.childSnapshot(forPath: "juistAntwoord").value as! String
                        self.waardePunten = child.childSnapshot(forPath: "punten").value as! Int
                        let antwoorden = child.childSnapshot(forPath: "Antwoorden")
                        
                        //self.lblVraag.text = vraag
                        self.vragenArray.append(vraag)
                        
                        for antwoord in antwoorden.children.allObjects as! [DataSnapshot] {
                            antwoordString = antwoord.value as! String
                            temparray.append(antwoordString)
                        }
                        
                        self.antwoordenArray.append(temparray)
                        //self.vragenArray.append(vraag)
                        
                    }
                }
            self.setAntwoorden()
        }
        //setAntwoorden()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAntwoord(_ sender: AnyObject)
    {
        let button = sender as! UIButton
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 190/255, green: 68/255, blue: 77/255, alpha: 1)
        
        if (sender.tag == Int(rightAnswerPlace))
        {
            print("Right!")
           // self.totaalScore += 1
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "GebruikerScore")+1, forKey: "GebruikerScore")
            switch categorieNaam {
            case "Metaal":
                metaalScore += 1
            case "Textiel":
                textielScore += 1
            case "Voeding":
                voedingScore += 1
            case "Hout":
                houtScore += 1
            default:
                print("failed")
            }
            sender.setTitle("CORRECT", for: .normal)
        }
        else
        {
            print("WRONG!!!!")
            sender.setTitle("JAMMER, FOUT", for: .normal)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            if(self.currentQuestion != self.vragenArray.count){
                self.setAntwoorden()
            }
        })
        
        if(self.currentQuestion >= self.vragenArray.count){
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.performSegue(withIdentifier: "naarCategorie", sender: self)
            })
        }
        if(themaCounter >= 4 && self.currentQuestion >= self.vragenArray.count){
            performSegue(withIdentifier: "naarWinnaar", sender: self)
            UserDefaults.standard.set(0, forKey: "aantalThemasGespeeld")
        }
    }
    func setAntwoorden(){
        self.lblVraag.text = self.vragenArray[currentQuestion]
        rightAnswerPlace = arc4random_uniform(4)+1
        var button:UIButton = UIButton()
        var x = 1
        
        for i in 1...4
        {
            button = view.viewWithTag(i) as! UIButton
            button.backgroundColor = .clear
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor =  UIColor(red: 190/255, green: 68/255, blue: 77/255, alpha: 1).cgColor
            button.setTitleColor(UIColor(red: 190/255, green: 68/255, blue: 77/255, alpha: 1), for: .normal)
            if(i == Int(rightAnswerPlace))
            {
                button.setTitle(self.antwoordenArray[currentQuestion][0], for: .normal)
            }
            else{
                button.setTitle(self.antwoordenArray[currentQuestion][x], for: .normal)
                x += 1
            }
        }
        //
        currentQuestion += 1
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if segue.identifier == "naarWinnaar"
        {
            if let destinationVC = segue.destination as? WinnaarViewController {
                destinationVC.myScore = UserDefaults.standard.integer(forKey: "GebruikerScore")
            }
        }
     }
    
}
