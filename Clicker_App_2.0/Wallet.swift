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
    private var _powerUps : [PowerUpTypes : Int] = [:]
    private var _counter : Int = 0
    private var _addon : Int = 1
    private var _totalMoney : Int = 0
    private var p : PriceMenu?
    
    init() {
        for pType in PowerUpTypes.allCases {
            self._powerUps[pType] = 0
        }
                
    }
    
    func setPriceMenu(priceMenu : PriceMenu) {
        self.p = priceMenu
    }
    
    var counter : Int {
        get { return _counter }
    }
    func incrementCounter() {
        _counter += _addon
        if _counter % 10 == 0 {
            _addon += 1
        }
    }
    
    func currentPoints() -> Int {
        return _counter
    }
    
    func pointsGained() -> Int {
        _balance = (_counter/10)
        return _balance
    }
    
    func addtoTotalThePoints() {
        _totalMoney += _balance
    }
    
    func getTotalMoney() -> String {
            return _totalMoney.roundedWithAbbreviations
    }
    
    func resetCounter() {
        _counter = 0
        _addon = 1
    }
    
    func addPowerUp(powerUp : PowerUpTypes) {
        _powerUps[powerUp]! += 1
    }
    
    func usePowerUp(powerUp : PowerUpTypes) {
        _powerUps[powerUp]! -= 1
    }
    
    func buyPowerUp(powerUp : PowerUpTypes) {
        let price = p!.generatePriceList(PowerUpType: powerUp)
        _totalMoney -= price
        addPowerUp(powerUp: powerUp)
        print("this ->\(_powerUps)<- ->\(_powerUps.count)<- ")
    }
    
    func canPayOrCannotPay(powerUp : PowerUpTypes) -> Bool {
        let price = p!.generatePriceList(PowerUpType: powerUp)
        if (_totalMoney - price) < 0 {
            return false
        } else {
            return true
        }
    }
    
    func powerUpCount(powerUp : PowerUpTypes) -> Int {
        let value = _powerUps[powerUp]!
            return value
        }
    }



