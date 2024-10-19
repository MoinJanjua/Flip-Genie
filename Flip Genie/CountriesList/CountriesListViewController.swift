//
//  CountriesListViewController.swift
//  Flip Genie
//
//  Created by Developer UCF on 25/07/2024.
//

import UIKit

class CountriesListViewController: UIViewController {

    @IBOutlet weak var countrieslistTableView: UITableView!

    var countryList = ["Head/Tail",      "Australia","China","France","India","Malaysia","Pakistan","Saudi Arabia","United Kingdom","America","Uzbekistan"]
    var countryImageList = ["coinHeads",      "AustraliaFront","ChinaFront","Francefront","IndiaFront","malysiafront","pakistanfront","Saudiafront","UKFront","UsFront","Uzbekistanfront"]
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        countrieslistTableView.delegate = self
        countrieslistTableView.dataSource = self
    }

    @IBAction func SettingButtontab(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
    }

    
    }



extension CountriesListViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountriesListTableViewCell
        let image_name = countryImageList[indexPath.row]
        cell.countryCoin.text = countryList[indexPath.row]
        cell.coinImage.image = UIImage(named: image_name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let name = countryList[indexPath.row]
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CoinflipViewController") as! CoinflipViewController
        newViewController.isFromCountryList = name
        newViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        newViewController.modalTransitionStyle = .crossDissolve
        self.present(newViewController, animated: true, completion: nil)
    }

    
    
}

    


