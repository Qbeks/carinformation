//
//  ViewController.swift
//  CarInformation
//
//  Created by Kamil Kubis on 04.03.2017.
//  Copyright © 2017 MobiSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnBrands: UIButton!
    @IBOutlet weak var btnOBD: UIButton!
    @IBOutlet weak var btnAddPhoto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundedBtn(btnBrands, width: 1, radius: 5)
        roundedBtn(btnOBD, width: 1, radius: 5)
        roundedBtn(btnAddPhoto, width: 1, radius: 5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func roundedBtn(_ btn: UIButton, width: CGFloat, radius: CGFloat) {
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = width
        btn.layer.cornerRadius = radius
    }

}

