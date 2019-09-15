class PatientList{
    var array : [Patient]
    init(patientArray: [Patient]){
        self.array = patientArray
    }
    func query(){
        print("what is the patient's name?")
        let fullName = readLine()
        for patient in array {
            if (patient.name == fullName!) {
                print(patient.name)
            }
        }
    }
    func addPatient(){
        let nameQuestion = SurveyQuestion (text: "What is your name?")
        nameQuestion.ask()
        let patient_name = readLine()
        let physicianQuestion = SurveyQuestion (text: "Who is your doctor?")
        physicianQuestion.ask()
        let physician_name = readLine()
        let test = Patient(patientName: patient_name!, patientPhysician: physician_name!, DateOfBirth: "Yesterday", patientSurgeries: "Knee", surveyanswers: ["idk"])
        array.append(test)
    }
    func removePatient(){
        print("what index?")
        let index = Int(readLine()!)
        array.remove(at: index!)
    }
}
class Patient{
    var name: String
    var typesurgery: String
    var physician: String
    var DOB: String
    var surveyanswers: [String]
    init(patientName: String, patientPhysician: String, DateOfBirth: String, patientSurgeries: String, surveyanswers: [String]){
        self.name = patientName
        self.DOB = DateOfBirth
        self.typesurgery = patientSurgeries
        self.physician = patientPhysician
        self.surveyanswers = surveyanswers
    }
}

class Survey: Patient{
    var symptoms:[String]
    var medication:[String]
    var painLevel:Int

    init(patientSymptom: [String],  patPhysician: String, patientMeds: [String],  patientPainLevel: Int, patientName: String, DateOfBirth: String, patientSurgeries: String, patSurvAnswer: [String]) {
        self.symptoms = patientSymptom
        self.medication = patientMeds
        self.painLevel = patientPainLevel
        super.init(patientName: patientName, patientPhysician: patPhysician, DateOfBirth: DateOfBirth, patientSurgeries: patientSurgeries, surveyanswers: patSurvAnswer)
    }
}

