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
    @IBOutlet weak var TIME_FREEZE_effect: UIImageView!
    @IBOutlet weak var TIME_FREEZE_effect2: UIImageView!
    @IBOutlet weak var TIME_FREEZE_count: UILabel!
    @IBOutlet weak var MEGA_NUKE_count: UILabel!
    @IBOutlet weak var EXPLOSION_count: UILabel!

    
    @IBAction func TIME_FREEZE_pressed(_ sender: Any) {
        if delegate.w.powerUpCount(powerUp: PowerUpTypes.TIME_FREEZE) >= 1 {
            delegate.w.usePowerUp(powerUp: PowerUpTypes.TIME_FREEZE)
            TIME_FREEZE_count.text = "Amount: \(delegate.w.powerUpCount(powerUp: PowerUpTypes.TIME_FREEZE))"
            TIME_FREEZE_effect.isHidden = false
            TIME_FREEZE_effect2.isHidden = false
            self.TIME_FREEZE_activated()
        } else {
            let alert = UIAlertController(title: "Not enough",
                                          message: "You do not have this powerup",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: {
                (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func MEGA_NUKE_pressed(_ sender: Any) {
        if delegate.w.powerUpCount(powerUp: PowerUpTypes.MEGA_NUKE) >= 1 {
            delegate.w.usePowerUp(powerUp: PowerUpTypes.MEGA_NUKE)
            MEGA_NUKE_count.text = "Amount: \(delegate.w.powerUpCount(powerUp: PowerUpTypes.MEGA_NUKE))"
            self.MEGA_NUKE_activated()
        } else {
            let alert = UIAlertController(title: "Not enough",
                                          message: "You do not have enough of this PowerUp",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: {
                (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func EXPLOSION_pressed(_ sender: Any) {
        if delegate.w.powerUpCount(powerUp: PowerUpTypes.EXPLOSION) >= 1 {
            delegate.w.usePowerUp(powerUp: PowerUpTypes.EXPLOSION)
            EXPLOSION_count.text = "Amount: \(delegate.w.powerUpCount(powerUp: PowerUpTypes.EXPLOSION))"
            EXPLOSION_activated()
        } else {
            let alert = UIAlertController(title: "Not enough",
                                          message: "You do not have this powerup",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: {
                (_) in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
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
    
    private func TIME_FREEZE_activated() {
        self.timer.invalidate()
        var timePaused : Double = 10
        var timerleft = Timer()
        timerleft = Timer.scheduledTimer(withTimeInterval: 0.01,
                                             repeats: true,
                                             block: {
            (_) in
            timePaused -= 0.01
            if timePaused <= 0 {
                timerleft.invalidate()
                self.TIME_FREEZE_effect.isHidden = true
                self.TIME_FREEZE_effect2.isHidden = true
                self.resumetimer()
            }
        })
    }
    
    private func MEGA_NUKE_activated() {
        for _ in 1...10 {
            delegate.w.incrementCounter()
        }
        CounterLabel.text = "\("$" + String(delegate.w.currentPoints()))"
    }
    
    private func EXPLOSION_activated() {
        self.timer.invalidate()
        var timePaused : Double = 10
        var timerleft = Timer()
        timerleft = Timer.scheduledTimer(withTimeInterval: 0.01,
                                             repeats: true,
                                         block: { [self]
            (_) in
            timePaused -= 0.15
            self.incrementCounter()
            self.CounterLabel.text = "\("$" + String(delegate.w.currentPoints()))"
            if timePaused <= 0 {
                timerleft.invalidate()
                self.resumetimer()
            }
        })
    }
    
    private func resumetimer() {
        self.timer.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                          repeats: true,
                                          block: {
            (_) in
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
        delegate.w.incrementCounter()
        CounterLabel.text = "\("$" + String(delegate.w.currentPoints()))"
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
        TIME_FREEZE_effect.isHidden = true
        TIME_FREEZE_effect2.isHidden = true
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


