class PatientList {
    let patientList = []
    
    func addPatient(){
        patientList.append(Patient)
    }
    func removePatient(){
        patientList.remove(Patient)
    }

}
class Patient{
    var name: String
    var typesurgery: String
    var physician: String
    var DOB: date
    let surveyanswers = []
    init(patientName: String, surgeryType: String, patientPhysician: String, DateOfBirth: Date, patientSurgeries: String){
        self.name = patientName
        self.DOB = DateOfBirth
        self.typesurgery = patientSurgeries
    
    }

}

class Survey: Patient{
    var symptoms:String
    var medication:String
    var painLevel:Int
    
    init(patientSymptom: [String],  patientMeds: [],  patientPainLevel: Int, patientName: String, DateOfBirth: Date, patientSurgeries: String) {
        self.symptoms = patientSymptom
        self.medication = patientMeds   
        self.painLevel = patientPainLevel
        super.init(patientName, DateOfBirth, patientSurgeries)
    }
}




