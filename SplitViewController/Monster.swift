//
//  Model.swift
//  SplitViewController
//
//  Created by nguyễn hữu đạt on 5/28/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
enum Weapon {
    case blowgun , ninjaStar , fire , sword , smoke
}
class Monster {
    let name : String
    let description : String
    let iconName : String
    let weapon : Weapon
    
    init(name : String , description : String, iconName : String, weapon : Weapon) {
        self.name = name
        self.description = description
        self.iconName = iconName
        self.weapon = weapon
    }
    var weaponImage : UIImage {
        switch weapon {
        case .blowgun:
            return UIImage(named: "1")!
        case .fire:
            return UIImage(named: "2")!
        case.ninjaStar:
            return UIImage(named: "3")!
        case.smoke:
            return UIImage(named: "4")!
        case.sword:
            return UIImage(named: "5")!
        }
    }
    var icon : UIImage? {
        return UIImage(named: "6")
    }
}
