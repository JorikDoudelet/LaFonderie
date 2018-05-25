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
    @IBOutlet weak var txtGebruikernaam: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        if segue.identifier == "naarCategorie"
        {
            let persoon = [
                "gebruikersnaam":  txtGebruikernaam.text,
                "totaalPunten": 0
            ] as [String : Any]
            
            self.ref.child("Persoon").childByAutoId().setValue(persoon)
            if let destinationVC = segue.destination as? KiesCategorieViewController {
            }
        }
    }
    

}
