heyyyyy
class PatientList {
}
class Patient{
    var name: String
    var typesurgery: String
    var physician: String
    var DOB: String
    let surveyanswers = [String]()
    init(patientName: String, surgeryType: String, patientPhysician: String, DateOfBirth: String, patientSurgeries: String){
=======
    let surveyanswers = []
    init(patientName: String, DateOfBirth: String, patientSurgeries: String){
>>>>>>> 7ffc8880e3148b8a35382391a26a6ea396e6e6a0
        self.name = patientName
        self.DOB = DateOfBirth
        self.typesurgery = patientSurgeries

    }
    static var patients = [Patient]()
    
    init() {
        Patient.patients.append(self)
    }
    
    init(name: String) {
        self.name = name
        Patient.patients.append(self)
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
        Patient.init(patientName, DateOfBirth, patientSurgeries)
    }
}


class Product {
    var name: String?
    
}







