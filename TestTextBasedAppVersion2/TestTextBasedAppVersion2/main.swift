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
let nameQuestion = SurveyQuestion (text: "What is your name?")
nameQuestion.ask()
let patient_name = readLine()
let physicianQuestion = SurveyQuestion (text: "Who is your doctor?")
physicianQuestion.ask()
let physician_name = readLine()

let test = Patient(patientName: patient_name!, patientPhysician: physician_name!, DateOfBirth: "Yesterday", patientSurgeries: "Knee", surveyanswers: ["idk"])
let testList = PatientList(patientArray: [])
testList.addPatient(patient: test)
testList.query()
