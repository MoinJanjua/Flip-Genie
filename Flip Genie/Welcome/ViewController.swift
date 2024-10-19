//
//  ViewController.swift
//  Flip Genie
//
//  Created by Developer UCF on 25/07/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomelbl: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startbtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        startbtn.titleLabel?.font = UIFont(name: "GillSans-SemiBold", size: 17)
        // Do any additional setup after loading the view.
    }

    
    
    //IBAction
    @IBAction func startButtonPressed(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CountriesListViewController") as! CountriesListViewController
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
    }

}

