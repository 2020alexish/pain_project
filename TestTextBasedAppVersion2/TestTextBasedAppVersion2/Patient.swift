class PatientList{
    var array : [Patient]
    init(patientArray: [Patient]){
        self.array = patientArray
    }
    func query(selectedInfo: String){
        print("what is the patient's name?")
        var fullName = readLine()
        for patient in array {
            if (patient.name == fullName!) {
                print(patient)
            }
        }
        print("What specific information would you like to see?")
        var selectedInfo = selectedInfo
        selectedInfo = readLine()!
        for object in array{
            if (object = selectedInfo){
                print(object)
            }
        }
    }
    func addPatient(patient: Patient){
		 array.append(patient)
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
        self.name = patient_name!
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
