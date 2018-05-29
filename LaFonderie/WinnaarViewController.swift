//
//  WinnaarViewController.swift
//  LaFonderie
//
//  Created by Gunnar Hemmeryckx on 28/05/18.
//  Copyright © 2018 Gunnar Hemmeryckx. All rights reserved.
//

import UIKit
import CoreData
class WinnaarViewController: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    
    @IBOutlet weak var lblGebruikersnaam: UILabel!
    
    @IBOutlet weak var podiumImage: UIImageView!
    var managedContext:NSManagedObjectContext?
    var opgehaaldeGebruiker = [Gebruiker]()
    var myScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        self.managedContext = appDelegate.persistentContainer.viewContext
        lblScore.text = "Score: \(self.myScore)"
        loadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        self.managedContext = appDelegate.persistentContainer.viewContext
        let persoonFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Gebruiker")
        //let opgehaaldePersonen:[Persoon]
        do{
            self.opgehaaldeGebruiker = try self.managedContext!.fetch(persoonFetch) as! [Gebruiker]
            print(self.opgehaaldeGebruiker[0].gebruikersnaam!)
            lblGebruikersnaam.text = self.opgehaaldeGebruiker[0].gebruikersnaam!
            //print(self.opgehaaldePersonen.count)
        }
        catch{
            fatalError("Failed to fetch employees: \(error)")
            
        }
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
