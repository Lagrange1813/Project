//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Lagrange1813 on 2021/11/4.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurantImageName)
    }
    
    @IBOutlet var restaurantImageView: UIImageView!
    var restaurantImageName = ""
    

}
