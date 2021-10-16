//
//  startViewController.swift
//  Clicker_App_2.0
//
//  Created by SEAN ULRIC BUGUINA CHUA stu on 14/10/21.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBAction func playButton(_ sender: Any) {
        self.performSegue(withIdentifier: "pressedPlay", sender: self)
    }
    @IBAction func shopButton(_ sender: Any) {
        performSegue(withIdentifier: "pressedShop", sender: nil)
    }
    @IBAction func creditsButton(_ sender: Any) {
    }
    @IBAction func BackToStart1(_ seg: UIStoryboardSegue) {
    }
    @IBAction func BackToStart2(_ seg: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureitems()
    }
    
    private func configureitems() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "gear"),
//            style: .done,
//            target: nil,
//            action: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pressedPlay" {
            let destination = segue.destination as! ViewController
            
        } else if segue.identifier == "pressedShop" {
            let destination = segue.destination as! ShopViewController
            
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
