class PatientList{
    var array : [Patient]
    
    init(patientArray: [Patient]){
        self.array = patientArray
    }
    
    func query(){
        
    }
    
    func add_patient(){
    
    }
    
    func remove_patient(){
    
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


class Product {
    var name: String?
    
}
