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
                print("Patient Name: \(patient.name)")
                print("Physician: \(patient.physician)")
                let dobToPrint = patient.DOB
                var dobArray2 = String(dobToPrint)
                var BirthYear = dobArray2.prefix(4)
                var monthityMonth = dobArray2.prefix(6)
                var BirthMonth = monthityMonth.suffix(2)
                var BirthDay = dobArray2.suffix(2)
                print("Date of Birth: \(BirthMonth) / \(BirthDay)  /  \(BirthYear)")
                print("Surgery Type: \(patient.typesurgery)")
            }
        }
    }
    func addPatient(){
        let user = Patient()
        array.append(user)
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
    var DOB: [Int]
    var surveyanswers: [String]
    init(patientName: String, patientPhysician: String, DateOfBirth: [Int], patientSurgeries: String, surveyanswers: [String]) {
    var DOB: Int
    var surveyanswers: [String]
    init(patientName: String, patientPhysician: String, DateOfBirth: Int, patientSurgeries: String, surveyanswers: [String]){
>>>>>>> 92c8dc3d4472a194b94f87e9ff7114ef64b694c9
        self.name = patientName
        self.DOB = DateOfBirth
        self.typesurgery = patientSurgeries
        self.physician = patientPhysician
        self.surveyanswers = surveyanswers
        }

    init(){
        let nameQuestion = SurveyQuestion (text: "What is your name?")
        nameQuestion.ask()
        self.name = readLine()!
       
        let physicianQuestion = SurveyQuestion (text: "Who is your doctor?")
        physicianQuestion.ask()
        self.physician = readLine()!
       

        
        let physicianQuestion = SurveyQuestion (text: "Who is your doctor?")
        physicianQuestion.ask()
       self.physician = readLine()!
        
        let DOB = SurveyQuestion (text: "When is your birthday? Enter MM/DD/YYYY")
        DOB.ask()
        let DateOfBirth = readLine()!
        let DOBArray = DateOfBirth.split(separator: "/", maxSplits: 3)
        let month = DOBArray[0]
        let day = DOBArray[1]
        let year = DOBArray[2]
        let birthday = year + month + day
        self.DOB = Int(birthday)!
        
        let surgeryTypeQuestion = SurveyQuestion (text: "What kind of surgery?")
        surgeryTypeQuestion.ask()
        self.typesurgery = readLine()!
        self.surveyanswers = [""]
        }
}
class Survey: Patient{
    var symptoms:[String]
    var medication:[String]
    var painLevel:Int

    init(patientSymptom: [String],  patPhysician: String, patientMeds: [String],  patientPainLevel: Int, patientName: String, DateOfBirth: Int, patientSurgeries: String, patSurvAnswer: [String]) {
        self.symptoms = patientSymptom
        self.medication = patientMeds
        self.painLevel = patientPainLevel
        super.init(patientName: patientName, patientPhysician: patPhysician, DateOfBirth: [DateOfBirth], patientSurgeries: patientSurgeries, surveyanswers: patSurvAnswer)
    }
}
    func displaymenu(){
        var answer2 = "YES"
        repeat{
            print("press 1 for add, press 2 for remove, press 3 for query")
            let answer = readLine()
            if answer == "1"{
                testList.addPatient()
            }
            if answer == "2"{
                testList.removePatient()
            }
            if answer == "3"{
                testList.query()
            }
            print("do you want to do something else? type YES or NO")
            answer2 = readLine()!
        }
            while answer2 == "YES"
    }

