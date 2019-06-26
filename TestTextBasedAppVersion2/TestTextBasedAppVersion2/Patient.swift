class patient{
    var name: String
    var typesurgery: String
    var physician: String
    var DOB: date
    var pain: int
    let symptoms = []
    let medications = []
    let patientList = []
    func addPatient(){
        patientList.append(Patient)
    }
    func removePatient(){
        patientList.remove(Patient)
    }
}
