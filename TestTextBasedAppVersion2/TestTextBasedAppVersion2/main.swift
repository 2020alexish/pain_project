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
let painQuestion = SurveyQuestion(text: "Can you rate your pain on a scale from 1-5?")
painQuestion.ask()
let pain = readLine()
let medQuestion = SurveyQuestion(text: "What medication have you taken today?")
medQuestion.ask()
let medication = readLine()
let symptomsQuestion = SurveyQuestion(text: "What are your symptoms?")
symptomsQuestion.ask()
let symptoms = readLine()
print ("Your pain is \(pain!).")
print ("Your medication is \(medication!).")
print ("Your sympytoms are \(symptoms!).")

func getPatientInfo(){
    let surveyanswers = [pain, medication, symptoms]
    for answer in surveyanswers{
        print (answer!)
    }
}


