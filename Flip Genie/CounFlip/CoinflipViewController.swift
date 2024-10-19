//
//  CoinflipViewController.swift
//  Flip Genie
//
//  Created by Developer UCF on 26/07/2024.
//
import Foundation
import UIKit
import AVFoundation
import GameKit

class CoinflipViewController: UIViewController , CAAnimationDelegate ,AVAudioPlayerDelegate {

    @IBOutlet weak var coinImg: UIImageView!
    @IBOutlet weak var flipCoinButton: UIButton!
    @IBOutlet weak var Titlelb: UILabel!
    @IBOutlet weak var imagebgview: UIView!
    
    
    //let coinProvider = CoinSideProvider()
    
    let colourProvider = BackgroundColourProvider()
    
    var flipButtonSound = URL(fileURLWithPath: Bundle.main.path(forResource: "switchSound", ofType: "mp3")!)
    
    var coinImageSound = URL(fileURLWithPath: Bundle.main.path(forResource: "tapSound", ofType: "mp3")!)
    
    
    var audioPlayerButton = AVAudioPlayer()
    
    var audioPlayerImage = AVAudioPlayer()
    
    var previousColour: UIColor?
    
    var isFromCountryList = String()
    
    var coinSides: [UIImage] = []
    
    var flipImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flipCoinButton.titleLabel?.font = UIFont(name: "GillSans-SemiBold", size: 17)

        Titlelb.text = isFromCountryList
        // Do any additional setup after loading the view.
        flipCoinButton.layer.cornerRadius = 20
        
        audioPlayerButton = try! AVAudioPlayer(contentsOf: flipButtonSound)
        audioPlayerImage = try! AVAudioPlayer(contentsOf: coinImageSound)
                      
                  
        // Setting the tap gesture to the coinImageView.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        coinImg.isUserInteractionEnabled = true
        coinImg.addGestureRecognizer(tapGestureRecognizer)
        setUpUI()
        
    }
    
    func setUpUI()
    {
        if isFromCountryList == "Australia"
        {
            coinSides.append(UIImage(named: "AustraliaFront")!)
            coinSides.append(UIImage(named: "AustraliaBack")!)
            coinImg.image = #imageLiteral(resourceName: "whitecoinside")
            flipImage = #imageLiteral(resourceName: "whitecoinside")
        }
        
        else if isFromCountryList == "China"
        {
            coinSides.append(UIImage(named: "ChinaFront")!)
            coinSides.append(UIImage(named: "ChinaBack")!)
            coinImg.image = #imageLiteral(resourceName: "whitecoinside")
            flipImage = #imageLiteral(resourceName: "whitecoinside")
            
        }
        
        else if isFromCountryList == "France"
        {
            coinSides.append(UIImage(named: "Francefront")!)
            coinSides.append(UIImage(named: "Franceback")!)
            coinImg.image = #imageLiteral(resourceName: "whitecoinside")
            flipImage = #imageLiteral(resourceName: "whitecoinside")
        }
        
       else if isFromCountryList == "India"
        
        {
            coinSides.append(UIImage(named: "IndiaFront")!)
            coinSides.append(UIImage(named: "IndiaBack")!)
           coinImg.image = #imageLiteral(resourceName: "coinSide")
           flipImage = #imageLiteral(resourceName: "coinSide")
        }
       else if isFromCountryList == "Malaysia"        {
            coinSides.append(UIImage(named: "malysiafront")!)
            coinSides.append(UIImage(named: "MalysiaBack")!)
           coinImg.image = #imageLiteral(resourceName: "whitecoinside")
           flipImage = #imageLiteral(resourceName: "whitecoinside")
       }
        
       else if isFromCountryList == "Pakistan"
        {
            coinSides.append(UIImage(named: "pakistanfront")!)
            coinSides.append(UIImage(named: "PakistanBack")!)
           coinImg.image = #imageLiteral(resourceName: "whitecoinside")
           flipImage = #imageLiteral(resourceName: "whitecoinside")
       }
       else if isFromCountryList == "Saudi Arabia"

        {
            coinSides.append(UIImage(named: "Saudiafront")!)
            coinSides.append(UIImage(named: "SaudiBack")!)
           coinImg.image = #imageLiteral(resourceName: "whitecoinside")
           flipImage = #imageLiteral(resourceName: "whitecoinside")
       }
       else if isFromCountryList == "United Kingdom"
        {
            coinSides.append(UIImage(named: "UKFront")!)
            coinSides.append(UIImage(named: "Ukback")!)
           coinImg.image = #imageLiteral(resourceName: "coinSide")
           flipImage = #imageLiteral(resourceName: "coinSide")
       }
       else if isFromCountryList == "America"
        {
            coinSides.append(UIImage(named: "UsFront")!)
            coinSides.append(UIImage(named: "Usback")!)
           coinImg.image = #imageLiteral(resourceName: "whitecoinside")
           flipImage = #imageLiteral(resourceName: "whitecoinside")
       }
      else if isFromCountryList == "Uzbekistan"
      {
          coinSides.append(UIImage(named: "Uzbekistanfront")!)
          coinSides.append(UIImage(named: "UzbekBack")!)
          coinImg.image = #imageLiteral(resourceName: "whitecoinside")
          flipImage = #imageLiteral(resourceName: "whitecoinside")
      }
        
     else if isFromCountryList == "Head/Tail"
    {
        coinSides.append(UIImage(named: "coinHeads")!)
        coinSides.append(UIImage(named: "coinTails")!)
        coinImg.image = #imageLiteral(resourceName: "coinSide")
         flipImage = #imageLiteral(resourceName: "coinSide")
    }
            
        
      
    }
    

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


@IBAction func showCoinFlip(_ sender: UIButton) {
    sender.pulsate()
    
    flipCoinButton.isEnabled = false
    
    audioPlayerButton.play()
    
    // Setting the random colour and making sure the previous colour is not repeated consecutively.
    var randomColour = colourProvider.randomColour()
    while previousColour == randomColour {
        randomColour = colourProvider.randomColour()
    }
    
    previousColour = randomColour
    
    imagebgview.backgroundColor = randomColour
    //flipCoinButton.tintColor = randomColour
    
    coinImg.image = flipImage
    
    audioPlayerButton.delegate = self
    rotateCoin()
    
}
    
    func rotateCoin() {
        let rotateAnimation = CABasicAnimation()
        rotateAnimation.keyPath = "transform.rotation"
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = 4 * Double.pi
        rotateAnimation.duration = 1.0
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.delegate = self
        
        coinImg.layer.add(rotateAnimation,
                     forKey: nil)
    }
    
   

    func animationDidStop(_ anim: CABasicAnimation, finished flag: Bool) {
        coinImg.layer.removeFromSuperlayer()
    }
    
   

    func randomCoinSide() -> UIImage {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: coinSides.count)
        return coinSides[randomNumber]
        }

func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    coinImg.image = randomCoinSide()
    flipCoinButton.isEnabled = true
}

@objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
    
    audioPlayerImage.play()
    
    audioPlayerImage.delegate = self
    
    _ = tapGestureRecognizer.view as! UIImageView
    
    // This is the bounce down animation.
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
        
    // This code sets the scale of the view to 70%.
    self.coinImg.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    }, completion: nil)
    
    // This is the bounce up animation, runs at the same time as bounce down.
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIView.AnimationOptions.allowUserInteraction, animations: { () -> Void in
        
    // This code sets the scale of the view to 100%.
    self.coinImg.transform = CGAffineTransform(scaleX: 1, y: 1)
    }, completion: nil)
}
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
