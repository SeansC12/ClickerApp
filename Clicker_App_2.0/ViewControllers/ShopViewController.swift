//
//  shopViewController.swift
//  Clicker_App_2.0
//
//  Created by SEAN ULRIC BUGUINA CHUA stu on 14/10/21.
//

import UIKit

class ShopViewController: UIViewController {
    
//    let w : Wallet = Wallet()
//    let p : PriceMenu = PriceMenu()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func TIME_FREEZEpressed(_ sender: Any) {
        delegate.w.addPowerUp(powerUp: PowerUpTypes.TIME_FREEZE)
        let PurchasingAlert = UIAlertController(title: "Are you sure?",
                                        message: "Purchases cannot be undone",
                                        preferredStyle: .alert)
        PurchasingAlert.addAction(UIAlertAction(title: "Continue",
                                        style: .destructive,
                                        handler: nil)) // TODO : Log powerup in inventory
        PurchasingAlert.addAction(UIAlertAction(title: "Cancel",
                                        style: .cancel,
                                        handler:
                                            { [self]
            (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(PurchasingAlert, animated: true, completion: nil)
    }
    @IBAction func MEGA_NUKEpressed(_ sender: Any) {
        delegate.w.addPowerUp(powerUp: PowerUpTypes.MEGA_NUKE)
    }
    @IBAction func EXPLOSIONpressed(_ sender: Any) {
        delegate.w.addPowerUp(powerUp: PowerUpTypes.EXPLOSION)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
