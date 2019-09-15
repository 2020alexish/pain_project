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
var answer2 = "YES"

repeat{
    print("press 1 for add, press 2 for remove, press 3 for query")
    let answer = readLine()
    if answer == "1"{
        testList.addPatient()
    }
    if answer == "2"{
        testList.removePatient()
    }
    if answer == "3"{
        testList.query()
    }
    print("do you want to do something else? type YES or NO")
    answer2 = readLine()!
}
    while answer2 == "YES"







