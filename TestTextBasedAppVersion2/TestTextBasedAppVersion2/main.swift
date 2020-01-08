//
//  main.swift
//  TestTextBasedAppVersion2
//
//  Created by Alexis Hedvat-20 on 6/17/19.
//  Copyright © 2019 Alexis Hedvat-20. All rights reserved.
//

import Foundation

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let testList = PatientList(patientArray: [])
//let testTime = Time(userInput: "02:30 PM")
//print(testTime.AM)
//print(testTime.numTime)

//load all previous patients

displayPrimaryMenu() //loads first menu


