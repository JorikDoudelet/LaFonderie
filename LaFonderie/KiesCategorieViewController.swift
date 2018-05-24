//
//  KiesCategorieViewController.swift
//  LaFonderie
//
//  Created by Gunnar Hemmeryckx on 24/05/18.
//  Copyright © 2018 Gunnar Hemmeryckx. All rights reserved.
//

import UIKit

class KiesCategorieViewController: UIViewController {

    @IBOutlet weak var metaalButton: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.metaalButton.layer.borderWidth = 1
        self.metaalButton.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
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
