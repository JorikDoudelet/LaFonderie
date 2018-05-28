//
//  buttonsMetAfbeeldingen.swift
//  LaFonderie
//
//  Created by LOOZEN Tillo (s) on 25/05/2018.
//  Copyright © 2018 Gunnar Hemmeryckx. All rights reserved.
//

import UIKit


    extension UIButton {
        open override func draw(_ rect: CGRect) {
            let borderAlpha : CGFloat = 0.7
            let cornerRadius : CGFloat = 10
            //provide custom style
            self.layer.borderWidth = 2.0
            self.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
            self.layer.cornerRadius = cornerRadius
              self.clipsToBounds = true
              self.contentMode = .center
            self.imageView?.contentMode = .scaleAspectFit
            
            
        }
    }
    
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        let borderAlpha : CGFloat = 0.7
//        let cornerRadius : CGFloat = 10
//
//
//        //        metaalbutton.backgroundColor = UIColor.clear
//        layer.borderWidth = 2.0
//        layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
//        layer.cornerRadius = cornerRadius
//    }
    
//    }

