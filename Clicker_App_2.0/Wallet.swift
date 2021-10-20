//
//  WalletBalanceAndCalculation.swift
//  Clicker_App_2.0
//
//  Created by SEAN ULRIC BUGUINA CHUA stu on 17/10/21.
//

import Foundation
public class Wallet {
    
    //balance is the money-system in the whole game, while counter is the money-system within that 10 seconds or within the "game"
    
    private var _balance : Int = 0
    private var _powerUps : [PowerUpTypes] = []
    private var _counter : Int = 0
    private var _addon : Int = 1
    private var _totalMoney : Int = 0
    private var p = PriceMenu()
    
    var counter : Int {
        get { return _counter }
    }
    func incrementCounter() -> Int {
        _counter += _addon
        if _counter % 10 == 0 {
            _addon += 1
        }
        return _counter
    }
    
    func pointsGained() -> Int {
        _balance = (_counter/10)
        return _balance
    }
    
    func addtoTotalThePoints() -> Int {
        _totalMoney += _balance
        return _totalMoney
    }
    
    func getTotalMoney() -> Int {
        return _totalMoney
    }
    
    func resetCounter() {
        _counter = 0
        _addon = 1
    }
    
    func addPowerUp(powerUp : PowerUpTypes) {
        _powerUps.append(powerUp)
    }
    
    func usePowerUp(powerUp : PowerUpTypes) -> PowerUpTypes {
        var index : Int = 0
        var usePowerUp : PowerUpTypes = PowerUpTypes.NOTHING //just to initialise the power
        for i in _powerUps {
            if i == powerUp {
                usePowerUp = _powerUps.remove(at: index)
                break
            }
            index += 1
        }
        return usePowerUp
    }
    
    func buyPowerUp(powerUp : PowerUpTypes) {
        let price = p.generatePriceList(PowerUpType: powerUp)
        _totalMoney -= price
        addPowerUp(powerUp: powerUp)
        print("this ->\(_powerUps)<- ->\(_powerUps.count)<- ")
    }
    
    func canPayOrCannotPay(powerUp : PowerUpTypes) -> Bool {
        let price = p.generatePriceList(PowerUpType: powerUp)
        if (_totalMoney - price) < 0 {
            return false
        } else {
            return true
        }
    }
}

