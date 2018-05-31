//
//  mijnWebviewController.swift
//  LaFonderie
//
//  Created by LOOZEN Tillo (s) on 29/05/2018.
//  Copyright © 2018 Gunnar Hemmeryckx. All rights reserved.
//

import UIKit
import WebKit

class mijnWebviewController: UIViewController {

    @IBOutlet weak var mijnwebview: WKWebView!
    
    var url = URL(string: "")
    var mijncategorie = String()
    var themaArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mijnurlrequest = URLRequest(url: url!)
        mijnwebview.load(mijnurlrequest)
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     
     if segue.identifier == "NaarDeQuizVragen"
     {
     if let destinationVC = segue.destination as? TestViewController {
     destinationVC.categorieNaam = mijncategorie
     themaArray.append(mijncategorie)
     // var aantalThemasGespeeld:Int?
     // aantalThemas.set(aantalThemasGespeeld!, forKey: "AantalThemas")
     print("THEMA ARRAY", themaArray)
     destinationVC.themaCounter = UserDefaults.standard.integer(forKey: "aantalThemasGespeeld")
     }
     
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
