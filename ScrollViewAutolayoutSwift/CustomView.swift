//
//  CustomView.swift
//  ScrollViewAutolayoutSwift
//
//  Created by anoop mohanan on 03/11/17.
//  Copyright © 2017 anoop. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet private weak var name:UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func layoutTheLabel() {
        name.text = "View\(arc4random())"
        let redLevel = CGFloat((Float(arc4random()) / Float(RAND_MAX)))
        let greenLevel = CGFloat((Float(arc4random()) / Float(RAND_MAX)))
        let blueLevel = CGFloat((Float(arc4random()) / Float(RAND_MAX)))
        backgroundColor = UIColor(red: redLevel, green: greenLevel, blue: blueLevel, alpha: 1.0)
    }

}
