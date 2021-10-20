//
//  PriceMenu.swift
//  Clicker_App_2.0
//
//  Created by SEAN ULRIC BUGUINA CHUA stu on 17/10/21.
//

import Foundation

public class PriceMenu {
    
    private var _powerup : [PowerUpTypes] = []
    
    func generatePriceList(PowerUpType : PowerUpTypes) -> Int {
        let pricelist : [PowerUpTypes : Int] = [PowerUpTypes.NOTHING : 0,
                                                PowerUpTypes.TIME_FREEZE : 2,
                                                PowerUpTypes.EXPLOSION : 1,
                                                PowerUpTypes.MEGA_NUKE : 1]
        let price = pricelist[PowerUpType]!
        return Int(price)
    }
}
