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
    
    var myScore = 0
    var currentQuestion = 0
    var rightAnswerPlace:UInt32 = 0
    var rightAnswer:String = ""
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
        
        self.ref = Database.database().reference()
        let quizVraagRef = self.ref.child("Thema/Metaal")
        quizVraagRef.observe(.value) { (snapShot) in
            if let snapshots = snapShot.children.allObjects as? [DataSnapshot] {
                    for child in snapshots {
                        //print("Child: ", child)
                        var temparray =  [String]()
                        var antwoordString:String = ""
                        let vraag = child.childSnapshot(forPath: "vraag").value as! String
                        self.rightAnswer = child.childSnapshot(forPath: "juistAntwoord").value as! String
                        print("Juist Antwoord: ", self.rightAnswer)
                        let antwoorden = child.childSnapshot(forPath: "Antwoorden")
                        
                        //self.lblVraag.text = vraag
                        self.vragenArray.append(vraag)
                        
                        for antwoord in antwoorden.children.allObjects as! [DataSnapshot] {
                            antwoordString = antwoord.value as! String
                            temparray.append(antwoordString)
                        }
                        
                        self.antwoordenArray.append(temparray)
                        //self.vragenArray.append(vraag)
                        
                        //print("Vragen: ", self.vragenArray)
                        print("Antwoorden: ", self.antwoordenArray)
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
            self.myScore += 1
            sender.setTitle("CORRECT", for: .normal)
        }
        else
        {
            print("WRONG!!!!")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            if(self.currentQuestion != self.vragenArray.count){
                self.setAntwoorden()
            }
        })
        if(self.currentQuestion >= self.vragenArray.count){
            performSegue(withIdentifier: "naarWinnaar", sender: self)
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
                destinationVC.myScore = self.myScore
            }
        }
     }
    
}
