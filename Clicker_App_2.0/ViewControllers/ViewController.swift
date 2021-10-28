//
//  ViewController.swift
//  Clicker_App_2.0
//
//  Created by SEAN ULRIC BUGUINA CHUA stu on 13/9/21.
//

import UIKit

class ViewController: UIViewController {

    var clicks = 0
    var totaltime = 10.00
    var timeLeftToResume = 10.00
    var timer = Timer()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var CounterLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    @IBAction func ButtonClicked(_ sender: Any) {
        incrementCounter()
        clicks += 1
    }
    @IBOutlet weak var TIME_FREEZE_count: UILabel!
    @IBOutlet weak var MEGA_NUKE_count: UILabel!
    @IBOutlet weak var EXPLOSION_count: UILabel!
    @IBOutlet weak var dumIndicator: UILabel!
    
    @IBAction func TIME_FREEZE_pressed(_ sender: Any) {
        delegate.w.usePowerUp(powerUp: PowerUpTypes.TIME_FREEZE)
        TIME_FREEZE_count.text = "Amount: \(delegate.w.powerUpCount(powerUp: PowerUpTypes.TIME_FREEZE))"
        dumIndicator.text = "Time Freeze Used"
        dumIndicator.isHidden = false
    }
    @IBAction func MEGA_NUKE_pressed(_ sender: Any) {
        delegate.w.usePowerUp(powerUp: PowerUpTypes.MEGA_NUKE)
        MEGA_NUKE_count.text = "Amount: \(delegate.w.powerUpCount(powerUp: PowerUpTypes.MEGA_NUKE))"
        dumIndicator.text = "Mega Nuke Used"
        dumIndicator.isHidden = false
    }
    @IBAction func EXPLOSION_pressed(_ sender: Any) {
        delegate.w.usePowerUp(powerUp: PowerUpTypes.EXPLOSION)
        EXPLOSION_count.text = "Amount: \(delegate.w.powerUpCount(powerUp: PowerUpTypes.EXPLOSION))"
        dumIndicator.text = "Explosion Used"
        dumIndicator.isHidden = false
    }
    
    
    @IBAction func LeaveGame(_ sender: Any) {
        self.timer.invalidate()
        let timeralert = UIAlertController(title: "Are you sure?",
                                           message: "Changes may not be saved",
                                           preferredStyle: .alert)
        timeralert.addAction(UIAlertAction(title: "Continue",
                                           style: .destructive,
                                           handler:
                                            {
            (_) in
            self.performSegue(withIdentifier: "LeaveGame", sender: self)
            
        }))
        timeralert.addAction(UIAlertAction(title: "Cancel",
                                           style: .cancel,
                                           handler:
                                            { [self]
            (_) in
            self.dismiss(animated: true, completion: nil)
            self.resumetimer()
        }))
        self.present(timeralert, animated: true, completion: nil)
    }
    
    private func resumetimer() {
        self.timer.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (_) in
            self.timeLeftToResume -= 0.01
            if self.timeLeftToResume <= 0 {
                self.timer.invalidate()
                self.performSegue(withIdentifier: "showResults", sender: nil)
                self.delegate.w.addtoTotalThePoints()
            }
            self.timeLeftLabel.text = "TimeLeft: \(String(format:"%.2f", self.timeLeftToResume))"
        })
    }
    
    private func points() {
        if delegate.w.counter >= 10 {
            pointsLabel.text = "Points: \(String(delegate.w.pointsGained()))"
        }
    }
    
    private func incrementCounter() {
        let counter : Int = delegate.w.incrementCounter()
        CounterLabel.text = "\("$" + String(counter))"
        self.view.backgroundColor = UIColor(red: CGFloat(Double.random(in: 0...1)), green: CGFloat(Double.random(in: 0...1)), blue: CGFloat(Double.random(in: 0...1)), alpha: 1)
        points()
    }
    
    private func configureitems() {
        self.navigationItem.hidesBackButton = true
        timeLeftToResume = totaltime
        pointsLabel.text = "Points: 0 ;-;"
        CounterLabel.text = "$0"
        timeLeftLabel.text = "Time Left: \(String(format : "%.2f", self.timeLeftToResume))"
        TIME_FREEZE_count.text = "Amount: \(delegate.w.powerUpCount(powerUp: PowerUpTypes.TIME_FREEZE))"
        MEGA_NUKE_count.text = "Amount: \(delegate.w.powerUpCount(powerUp: PowerUpTypes.MEGA_NUKE))"
        EXPLOSION_count.text = "Amount: \(delegate.w.powerUpCount(powerUp: PowerUpTypes.EXPLOSION))"
        dumIndicator.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureitems()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.resumetimer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let destinationViewController =
            segue.destination as! ResultsViewController
            destinationViewController.numberofclicks = self.clicks
            destinationViewController.allocatedTime = self.totaltime
            destinationViewController.moneyearned = self.delegate.w.counter
        }
    }
}


