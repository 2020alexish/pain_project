class PatientList {
    var patientList = [Patient]()
    
    func addPatient(){
        patientList.append(Patient)
    }
    func removePatient(){
        patientList.remove(at: Patient)
    }

}
class Patient{
    var name: String
    var typesurgery: String
    var physician: String
    var DOB: String
    let surveyanswers = [String]
    init(patientName: String, surgeryType: String, patientPhysician: String, DateOfBirth: String, patientSurgeries: String){
        self.name = patientName
        self.DOB = DateOfBirth
        self.typesurgery = patientSurgeries
    
    }

}

class Survey: Patient{
    var symptoms:[String]
    var medication:[String]
    var painLevel:Int
    
    init(patientSymptom: [String],  patientMeds: [String],  patientPainLevel: Int, patientName: String, DateOfBirth: String, patientSurgeries: String) {
        self.symptoms = patientSymptom
        self.medication = patientMeds   
        self.painLevel = patientPainLevel
        super.init(patientName, DateOfBirth, patientSurgeries)
    }
}




