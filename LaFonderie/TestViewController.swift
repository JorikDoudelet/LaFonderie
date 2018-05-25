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

    
    @IBOutlet weak var lblVraag: UILabel!
    var ref: DatabaseReference!
    var answers = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        self.ref = Database.database().reference()
        let quizVraagRef = self.ref.child("Thema/Metaal").child("vraag1").child("vraag")
        let antwoordenRef = self.ref.child("Thema/Metaal").child("vraag1").child("Antwoorden")
        print(antwoordenRef)
        quizVraagRef.observe(.value) { (snapShot) in
            let vraag = snapShot.value as? String
            self.lblVraag.text = vraag
        }
        antwoordenRef.observe(.value) { (snapShot) in
            
            let antwoorden = snapShot.value as? String
            print(antwoorden)
            //self.answers.append([antwoorden!])
            
        }
        //print(self.answers)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAntwoord(_ sender: AnyObject)
    {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
