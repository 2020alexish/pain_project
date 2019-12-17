import Foundation

class PatientList{
    var array : [Patient]
    init(patientArray: [Patient]){
        self.array = patientArray
    }
    func query(){
        print("what is the patient's name?")
        let fullName = readLine()
        for patient in array {
//            print(patient.patientstring())
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
    var MedArray: [Medications]
    init(patientName: String, patientPhysician: String, DateOfBirth: Int, patientSurgeries: String, PainArray: [Pain], MedArray: [Medications]){
        self.name = patientName
        self.DOB = DateOfBirth
        self.typesurgery = patientSurgeries
        self.physician = patientPhysician
        self.PainArray = PainArray
        self.MedArray = MedArray
        }
    
    func addPainSurvey(){
        let painpain = PainSurvey()
        self.PainArray.append(painpain.createPain())
    }
    
    func addMedicationSurvey(){
        let medmed = MedSurvey()
        self.MedArray.append(medmed.createMedications())
    }
    func getPatientFile(){
        var patientString = "\(self.name), \(self.typesurgery), \(self.DOB), \(self.physician), \(self.PainArray)"
    }
    func stringToObject(patientString: String){
        let BrokenString = patientString.split(separator: ",")
        self.name = String(BrokenString[0])
        self.typesurgery = String(BrokenString[1])
        self.DOB = Int(BrokenString[2])!
        self.physician = String(BrokenString[3])
        self.PainArray = []
        self.MedArray = []
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
        
        super.init(patientName: Name, patientPhysician: Physician, DateOfBirth: DOB, patientSurgeries: SurgType, PainArray: [], MedArray: [])
    }
    
    func createPatient()->Patient{
        let patient = Patient(patientName:self.name, patientPhysician: self.physician, DateOfBirth:self.DOB, patientSurgeries:self.typesurgery, PainArray: self.PainArray, MedArray: self.MedArray)
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

class Medications{
    var medName:String
    var dose:Int
    // var time: String create time object
    
    init(medName: String, dose:Int) {
        self.medName = medName
        self.dose = dose
    }
    
}
class MedSurvey: Medications {
    init(){
        let medName = SurveyQuestion (text: "What's the name of your medication?")
        medName.ask()
        var med = readLine()!
        let dose = SurveyQuestion (text: "How many did you take?")
        dose.ask()
        let Dose = readLine()!
        var pDose = Int(Dose)!

        super.init(medName: med, dose:pDose)
    }
    
    func createMedications()->Medications {
        let medication = Medications(medName: self.medName, dose: self.dose)
        return medication
    }
}

    func displaymenu(){
        var answer2 = "YES"
        repeat{
            print("press 1 for add, press 2 for remove, press 3 for query, press 4 to take the pain survey, press 5 to take medication survey")
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
            if answer == "5"{
                testList.array[0].addMedicationSurvey()
            }
            if answer == "6"{
                let filemgr = FileManager.default
                if filemgr.fileExists(atPath: "/Users/2020noal/workspace/pain_project/TestTextBasedAppVersion2/TestTextBasedAppVersion2/testtest.txt") {
                    print("File exists")
                } else {
                    print("File not found")
                }
                //read
                var filepath1 = "/Users/2020noal/workspace/pain_project/TestTextBasedAppVersion2/TestTextBasedAppVersion2/testtest.txt"
                let databuffer = filemgr.contents(atPath: filepath1)
                print(String(data: databuffer!, encoding: .utf8)!)
               //write
                let file: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
                if file == nil {
                    print("File open failed")
                } else {
                    let data = ("black dog" as
                        NSString).data(using: String.Encoding.utf8.rawValue)
                    file?.seek(toFileOffset: 12)
                    file?.write(data!)
                    file?.closeFile()
                }
            }
            print("do you want to do something else? type YES or NO")
            answer2 = readLine()!
        }
            while answer2 == "YES"
        if answer2 == "6" {
            print("no")
        }
    }

