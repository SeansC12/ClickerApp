//
//  startViewController.swift
//  Clicker_App_2.0
//
//  Created by SEAN ULRIC BUGUINA CHUA stu on 14/10/21.
//

import UIKit

class StartViewController: UIViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func playButton(_ sender: Any) {
        self.performSegue(withIdentifier: "pressedPlay", sender: self)
    }
    @IBAction func shopButton(_ sender: Any) {
        self.performSegue(withIdentifier: "pressedShop", sender: self)
    }
    @IBAction func creditsButton(_ sender: Any) {
        self.performSegue(withIdentifier: "pressedCredits", sender: self)
    }
    
    @IBAction func BackToStart1(_ seg: UIStoryboardSegue) {
    }
    @IBAction func BackToStart2(_ seg: UIStoryboardSegue) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureitems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        delegate.w.resetCounter()
    }
    
    private func configureitems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .done,
            target: self,
            action: #selector(SettingsPressed))
        
    }
    
    @objc func SettingsPressed() {
        self.performSegue(withIdentifier: "SettingsPressed", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pressedPlay" {
            segue.destination as! ViewController
        } else if segue.identifier == "pressedShop" {
            segue.destination as! ShopViewController
        } else if segue.identifier == "pressedCredits" {
            segue.destination as! CreditsViewController
        }
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
