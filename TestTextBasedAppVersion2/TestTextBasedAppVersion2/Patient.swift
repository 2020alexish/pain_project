class patient{
    var name: String
    var typesurgery: String
    var physician: String
    var DOB: date
    let patientList = []
	init(var patientName, var DateOfBirth, var patientSurgeries, var symptom){
        
    }
    func addPatient(){
        patientList.append(Patient)
    }
    func removePatient(){
        patientList.remove(Patient)
	}
}
class survey extends patient{
    var symptoms:String
    var medication:String
    var painLevel:int
    
    init(var patientSymptom, var patientMeds, var patientPainLevel) {
        symtpoms = patientSymptom
        medication = patientMeds
        painLevel = patientPainLevel
    }
}
