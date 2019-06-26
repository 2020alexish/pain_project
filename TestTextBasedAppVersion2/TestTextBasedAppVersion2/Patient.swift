class patient {
    var name:String
    var DOB:Date
    var Surgeries:[String]
    var PatientList:[String]
   
    
    init(var patientName, var DateOfBirth, var patientSurgeries, var symptom,){
        
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
