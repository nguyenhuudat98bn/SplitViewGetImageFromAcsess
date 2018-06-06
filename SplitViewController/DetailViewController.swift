//
//  ViewController.swift
//  SplitViewController
//
//  Created by nguyễn hữu đạt on 5/28/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    var monster: Monster? {
        didSet {
            refreshUI()
        }
    }
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var weaponImageView: UIImageView!
        override func viewDidLoad() {
        super.viewDidLoad()
            zoomImage()
            
    }
    func zoomImage(){
        scrollView.maximumZoomScale = 1
        scrollView.minimumZoomScale = 10
        scrollView.delegate = self
        scrollView.zoomScale = 1
        
    }
    func viewForZooming(in scrollview : UIScrollView) -> UIView? {
        return weaponImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func refreshUI() {
        loadViewIfNeeded()
        nameLabel.text = monster?.name
        descriptionLabel.text = monster?.description
        iconImageView.image = monster?.icon
        weaponImageView.image = monster?.weaponImage
    }

}
extension DetailViewController: MonsterSelectionDelegate {
    func monsterSelected(_ newMonster: Monster) {
        monster = newMonster
    }
}
