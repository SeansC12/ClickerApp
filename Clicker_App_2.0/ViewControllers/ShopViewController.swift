//
//  ShopViewController.swift
//  Clicker_App_2.0
//
//  Created by SEAN ULRIC BUGUINA CHUA stu on 14/10/21.
//

import UIKit

class ShopViewController: UIViewController {
    
    var selectedPowerUP : PowerUpTypes = PowerUpTypes.NOTHING
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let PurchasingAlert = UIAlertController(title: "Are you sure?",
                                            message: "Purchases cannot be undone",
                                            preferredStyle: .alert)
    let NotEnoughMoneyAlert = UIAlertController(title: "You do not have enough money",
                                                message: "Too poor, peasant",
                                                preferredStyle: .alert)
    
    func configureAlerts() {
        PurchasingAlert.addAction(UIAlertAction(title: "Continue",
                                                style: .destructive,
                                                handler:
                                                    { [self]
            (_) in
            delegate.w.buyPowerUp(powerUp: selectedPowerUP)
            balanceCounter.text = "$\(delegate.w.getTotalMoney())"
        }))
        PurchasingAlert.addAction(UIAlertAction(title: "Cancel",
                                                style: .cancel,
                                                handler:
                                                    { [self]
            (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        NotEnoughMoneyAlert.addAction(UIAlertAction(title: "Cancel",
                                                    style: .cancel,
                                                    handler: { [self]
            (_) in
            self.dismiss(animated: true, completion: nil)
        }))
    }
    
    @IBOutlet weak var balanceCounter: UILabel!
    @IBAction func TIME_FREEZEpressed(_ sender: Any) {
        selectedPowerUP = PowerUpTypes.TIME_FREEZE
        if delegate.w.canPayOrCannotPay(powerUp: selectedPowerUP) {
            // Successfully bought the powerup
            self.present(PurchasingAlert, animated: true, completion: nil)
        } else {
            // Unsuccessful
            self.present(NotEnoughMoneyAlert, animated: true, completion: nil)
        }
    }
    @IBAction func MEGA_NUKEpressed(_ sender: Any) {
        selectedPowerUP = PowerUpTypes.MEGA_NUKE
        if delegate.w.canPayOrCannotPay(powerUp: selectedPowerUP) {
            self.present(PurchasingAlert, animated: true, completion: nil)
        } else {
            self.present(NotEnoughMoneyAlert, animated: true, completion: nil)
        }
    }
    @IBAction func EXPLOSIONpressed(_ sender: Any) {
        selectedPowerUP = PowerUpTypes.EXPLOSION
        if delegate.w.canPayOrCannotPay(powerUp: selectedPowerUP) {
            self.present(PurchasingAlert, animated: true,  completion: nil)
        } else {
            self.present(NotEnoughMoneyAlert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAlerts()
        balanceCounter.text = "$\(delegate.w.getTotalMoney())"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}
