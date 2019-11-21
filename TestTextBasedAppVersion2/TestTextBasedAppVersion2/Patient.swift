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
        let user = Survey()
        self.array.append(user.createPatient())
    }

    func removePatient(){
        print("what index?")
        let index = Int(readLine()!)
        self.array.remove(at: index!)
    }
}


class Patient{
    var name: String
    var typesurgery: String
    var physician: String
    var DOB: Int
    var PainArray: [Pain]
    init(patientName: String, patientPhysician: String, DateOfBirth: Int, patientSurgeries: String, PainArray: [Pain]){
        self.name = patientName
        self.DOB = DateOfBirth
        self.typesurgery = patientSurgeries
        self.physician = patientPhysician
        self.PainArray = PainArray
        }
    
    func addPainSurvey(){
        let painpain = PainSurvey()
        self.PainArray.append(painpain.createPain())
    }
}

class Survey: Patient{
   
    init(){
        let nameQuestion = SurveyQuestion (text: "What is your name?")
        nameQuestion.ask()
        var Name = readLine()!
        
        
        let physicianQuestion = SurveyQuestion (text: "Who is your doctor?")
        physicianQuestion.ask()
        var Physician = readLine()!
        
        
        let DOBquestion = SurveyQuestion (text: "When is your birthday? Enter MM/DD/YYYY")
        DOBquestion.ask()

        let DateOfBirth = readLine()!
        let DOBArray = DateOfBirth.split(separator: "/", maxSplits: 3)
        let month = DOBArray[0]
        let day = DOBArray[1]
        let year = DOBArray[2]
        let birthday = year + month + day
        let DOB = Int(birthday)!
        let surgeryTypeQuestion = SurveyQuestion (text: "What kind of surgery?")
        surgeryTypeQuestion.ask()
        let SurgType = readLine()!
        
        super.init(patientName: Name, patientPhysician: Physician, DateOfBirth: DOB, patientSurgeries: SurgType, PainArray: [])
    }
    
    func createPatient()->Patient{
        let patient = Patient(patientName:self.name, patientPhysician: self.physician, DateOfBirth:self.DOB, patientSurgeries:self.typesurgery, PainArray: self.PainArray)
        return patient
    }
}
class Pain {
    var symptom:String
    var painLevel:Int
    var painPlace: String
    
    init(patSymptom: String, patPainLevel:Int, patPlace: String) {
        self.painLevel = patPainLevel
        self.symptom = patSymptom
        self.painPlace = patPlace
    }
}
class PainSurvey: Pain {
    init(){
        let place = SurveyQuestion (text: "Where does it hurt?")
        place.ask()
        var Place = readLine()!
        let level = SurveyQuestion (text: "What is your pain level on a scale of 1-5?")
        level.ask()
        let Level = readLine()!
        var pLevel = Int(Level)!
        
    
        let symptoms = SurveyQuestion (text: "What are your symptoms")
        symptoms.ask()
        
        var Symptoms = readLine()!
        let nextQ = SurveyQuestion (text: "Do you have any more symtpoms? [Y for yes, N for no]")
    
        super.init(patSymptom: Symptoms, patPainLevel: pLevel, patPlace: Place)
    }
    
    func createPain()->Pain {
        let pain = Pain(patSymptom: self.symptom, patPainLevel: self.painLevel, patPlace: self.painPlace)
        return pain
    }
}

    func displaymenu(){
        var answer2 = "YES"
        repeat{
            print("press 1 for add, press 2 for remove, press 3 for query, press 4 to take the pain survey")
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
            if answer == "4"{
                let surveyQ = SurveyQuestion (text: "What is your patient number?")
                surveyQ.ask()
                let surveyIndex = readLine()!
                let intSurveyIndex = Int(surveyIndex)!
                testList.array[intSurveyIndex].addPainSurvey()
            }
            print("do you want to do something else? type YES or NO")
            answer2 = readLine()!
        }
            while answer2 == "YES"
    }

