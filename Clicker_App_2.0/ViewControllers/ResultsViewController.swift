//
//  resultsViewController.swift
//  Clicker_App_2.0
//
//  Created by SEAN ULRIC BUGUINA CHUA stu on 13/9/21.
//

import UIKit

class ResultsViewController: UIViewController {

    var moneyearned : Int!
    var numberofclicks : Int!
    var allocatedTime : Double!
    
    @IBOutlet weak var clicksLabel: UILabel!
    
    @IBOutlet weak var clicksPerSecondLabel: UILabel!
    
    func clickspersecond() -> String {
        let clickspersecond : String = String(format : "%.2f", Double(numberofclicks)/allocatedTime)
        return clickspersecond
    }
    
    func configureitems() {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureitems()
        // Do any additional setup after loading the view.
        clicksLabel.text = "Amount Earned: $\(moneyearned!)"
        clicksPerSecondLabel.text = "Clicks Per Second: \(clickspersecond())"
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
