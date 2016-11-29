//
//  ProfileEntry.swift
//  Plum
//
//  Created by 大畅 on 2016/11/17.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

struct ProfileEntryArchive {
    static var healthProfiles : [ProfileEntry] = [ProfileEntry]()
    static var currentProfileIndex : Int = 0
}

class ProfileEntry: NSObject {
    
    var profileName : String
    
    var dateOfBirth : String
    
    var gender : String
    
    var bloodType : String
    
    var height : String
    
    var weight : String
    
    var medicalConditions : String
    
    var allergies : String
    
    var medication : String
    
    init(name: String, bir: String, gen: String, blo: String, hei: String, wei: String, medcon: String, allgy: String, medca: String) {
        self.profileName = name
        self.dateOfBirth = bir
        self.gender = gen
        self.bloodType = blo
        self.height = hei
        self.weight = wei
        self.medicalConditions = medcon
        self.allergies = allgy
        self.medication = medca
    }
}
