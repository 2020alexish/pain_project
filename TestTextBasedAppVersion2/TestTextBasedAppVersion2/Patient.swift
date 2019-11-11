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
    var DOB: Int
    var surveyanswers: [String]
    init(patientName: String, patientPhysician: String, DateOfBirth: Int, patientSurgeries: String, surveyanswers: [String]){
        self.name = patientName
        self.DOB = DateOfBirth
        self.typesurgery = patientSurgeries
        self.physician = patientPhysician
        self.surveyanswers = surveyanswers
        }
    
    func addPainSurvey(){
        let painpain = PainSurvey()
        PainArray.append(painpain.createPain())
    }
}

class Survey: Patient{
//    var medication:[String]
//    init(patientSymptom: [String],  patPhysician: String, patientMeds: [String],  patientPainLevel: Int, patientName: String, DateOfBirth: Int, patientSurgeries: String, patSurvAnswer: [String]) {
//        self.medication = patientMeds
//        super.init(patientName: patientName, patientPhysician: patPhysician, DateOfBirth: DateOfBirth, patientSurgeries: patientSurgeries)
//    }
   
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
        self.DOB = Int(birthday)!
        let surgeryTypeQuestion = SurveyQuestion (text: "What kind of surgery?")
        surgeryTypeQuestion.ask()
        var SurgType = readLine()!
        
        super.init(patientName: Name, patientPhysician: Physician, DateOfBirth: DOB, patientSurgeries: SurgType)
    }
    
    func createPatient()->Patient{
        let patient = Patient(patientName:self.name, patientPhysician: self.physician, DateOfBirth:self.DOB, patientSurgeries:self.typesurgery)
        return patient
    }
}
class Pain {
    var symptom:String
    var painLevel:Int
    var numSymptoms:Int
    var numOfPainPlaces:Int
    
    init(patSymptom: String, patPainLevel:Int, patNumSymtpoms:Int, patNumOfPainPlaces:Int) {
        self.painLevel = patPainLevel
        self.numSymptoms = patNumSymtpoms
        self.numOfPainPlaces = patNumOfPainPlaces
        self.symptom = patSymptom
    }
}
class PainSurvey: Pain {
    init(){
        var More:String
        repeat {
            let place = SurveyQuestion (text: "Where does it hurt?")
            place.ask()
            var Place = readLine()!
            let level = SurveyQuestion (text: "What is your pain level on a scale of 1-5?")
            level.ask()
            var Level = readLine()!
            let nextQ = SurveyQuestion (text: "Does it hurt anywhere else [Y for yes, N for no]")
            nextQ.ask()
            More = readLine()!
        } while More == "Y"
        var moreSymps: String
        repeat {
            let symptoms = SurveyQuestion (text: "What are your symptoms")
            symptoms.ask()
            
            var Symptoms = readLine()!
            let nextQ = SurveyQuestion (text: "Do you have any more symtpoms? [Y for yes, N for no]")
            nextQ.ask()
            moreSymps = readLine()!
        } while moreSymps == "Y"
        super.init(patSymptom: symptom, patPainLevel: painLevel, patNumSymtpoms: numSymptoms, patNumOfPainPlaces: numOfPainPlaces)
    }
    
    func createPain()->Pain {
        let pain = Pain(patSymptom: self.symptom, patPainLevel: self.painLevel, patNumSymtpoms: self.numSymptoms, patNumOfPainPlaces: self.numOfPainPlaces)
        return pain
    }

    init(patientSymptom: [String],  patPhysician: String, patientMeds: [String],  patientPainLevel: Int, patientName: String, DateOfBirth: Int, patientSurgeries: String, patSurvAnswer: [String]) {
        self.symptoms = patientSymptom
        self.medication = patientMeds
        self.painLevel = patientPainLevel
        super.init(patientName: patientName, patientPhysician: patPhysician, DateOfBirth: DateOfBirth, patientSurgeries: patientSurgeries, surveyanswers: patSurvAnswer)
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
            if answer == "4"{
                testList.query()
            }
            print("do you want to do something else? type YES or NO")
            answer2 = readLine()!
        }
            while answer2 == "YES"
    }

