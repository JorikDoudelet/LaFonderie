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
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var podiumImage: UIImageView!
    var myScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        lblScore.text = "Score: \(self.myScore)"
        lblGebruikersnaam.text = UserDefaults.standard.string(forKey: "Gebruikersnaam")
        avatarImage.image = UIImage(named: UserDefaults.standard.string(forKey: "AvatarNaam")!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
