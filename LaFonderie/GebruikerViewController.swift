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
    
    var ref: DatabaseReference!
    var isSolo:Bool = false
    var avatarNaam:String = ""
    var managedContext:NSManagedObjectContext?
    @IBOutlet weak var txtGebruikernaam: UITextField!
    @IBOutlet var avatarButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        self.managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Gebruiker")
        
        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try managedContext?.fetch(fetchRequest) as! [NSManagedObject]
            
            for item in items {
                managedContext?.delete(item)
            }
            
            // Save Changes
            try managedContext?.save()
            
        } catch {
            // Error Handling
            // ...
        }
        
        print(isSolo)
        self.ref = Database.database().reference()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func avatarSelected(_ sender: Any)
    {
        let tappedButton = sender as! UIButton
        
        tappedButton.backgroundColor = UIColor.gray
        tappedButton.isSelected = true
        //avatarNaam = tappedButton.currentImage
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
                    let gebruiker = NSEntityDescription.insertNewObject(forEntityName: "Gebruiker", into: self.managedContext!) as! Gebruiker
                    
                    gebruiker.gebruikersnaam = txtGebruikernaam.text
                    
                    do{
                        try self.managedContext!.save()
                    }
                    catch{
                        fatalError("Failure to save context: \(error)")
                        
                    }
                }
            }
        }
    }
    
    
}
