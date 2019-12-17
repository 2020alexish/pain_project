class PatientList{
    var array : [Patient]
    init(patientArray: [Patient]){
        self.array = patientArray
    }
    func query(){
        print("what is the patient's name?")
        let fullName = readLine()
        for patient in array {
            if (patient.firstName == fullName!) {
                print("Patient Name: \(patient.lastName), \(patient.firstName)")
                print("Physician: \(patient.physician)")
                let dobToPrint = patient.DOB
                let dobArray2 = String(dobToPrint)
                let BirthYear = dobArray2.prefix(4)
                let monthityMonth = dobArray2.prefix(6)
                let BirthMonth = monthityMonth.suffix(2)
                let BirthDay = dobArray2.suffix(2)
                print("Date of Birth: \(BirthMonth) / \(BirthDay)  /  \(BirthYear)")
                print("Surgery Type: \(patient.typesurgery)")
            }
             if (patient.firstName != fullName!) {
                print("this patient does not exist")
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
        if ((index! > self.array.count) || (self.array.count == 0)){
            print("this patient does not exist")
        }
        else{
            self.array.remove(at: index!)
        }
    }
   
    func savePatient(){
        for patient in array{
            print(patient.getPatientFile())
        }
    }
}


class Patient{
    var firstName: String
    var lastName: String
    var gender: String
    var typesurgery: String
    var physician: String
    var DOB: Int
    var PainArray: [Pain]
    var MedArray: [Medications]
    init(patientFirstName: String, patientLastName: String, patientGender: String, patientPhysician: String, DateOfBirth: Int, patientSurgeries: String, PainArray: [Pain], MedArray: [Medications]){
        self.firstName = patientFirstName
        self.lastName = patientLastName
        self.gender = patientGender
        self.DOB = DateOfBirth
        self.typesurgery = patientSurgeries
        self.physician = patientPhysician
        self.PainArray = PainArray
        self.MedArray = MedArray
        }
    init(patientString: String){
        let brokenString = patientString.split(separator: ",") //add last and gender
        self.firstName = String(brokenString[0])
        self.lastName = String(brokenString[1])
        self.gender = String(brokenString[2])
        self.typesurgery = String(brokenString[3])
        self.DOB = Int(brokenString[4])!
        self.physician = String(brokenString[5])
        self.PainArray = []
        self.MedArray = []
    }
    
    func addPainSurvey(){
        let painpain = PainSurvey()
        self.PainArray.append(painpain.createPain())
    }
    
    func addMedicationSurvey(){
        let medmed = MedSurvey()
        self.MedArray.append(medmed.createMedications())
    }
    func getPatientFile()->String{
        var patientString = "\(self.firstName), \(self.lastName), \(self.gender), \(self.typesurgery), \(self.DOB), \(self.physician)"
        return patientString
    }
    
    
    
}

class Survey: Patient{
   
    init(){
        let firstNameQuestion = SurveyQuestion (text: "What is your first name?")
        firstNameQuestion.ask()
        let FirstName = readLine()!
        
        let lastNameQuestion = SurveyQuestion (text: "What is your last name?")
        lastNameQuestion.ask()
        let LastName = readLine()!
        
        let genderQuestion = SurveyQuestion (text: "What is your gender?")
        genderQuestion.ask()
        let Gender = readLine()!
        
        
        let physicianQuestion = SurveyQuestion (text: "Who is your doctor?")
        physicianQuestion.ask()
        let Physician = readLine()!
        
        
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
        
        super.init(patientFirstName: FirstName, patientLastName: LastName, patientGender: Gender, patientPhysician: Physician, DateOfBirth: DOB, patientSurgeries: SurgType, PainArray: [], MedArray: [])
    }
    
    func createPatient()->Patient{
        let patient = Patient(patientFirstName:self.firstName, patientLastName:self.lastName, patientGender:self.gender, patientPhysician: self.physician, DateOfBirth:self.DOB, patientSurgeries:self.typesurgery, PainArray: self.PainArray, MedArray: self.MedArray)
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
        let Place = readLine()!
        let level = SurveyQuestion (text: "What is your pain level on a scale of 1-5?")
        level.ask()
        let Level = readLine()!
        let pLevel = Int(Level)!
        
    
        let symptoms = SurveyQuestion (text: "What are your symptoms")
        symptoms.ask()
        
        let Symptoms = readLine()!
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
    
    init(medName: String, dose:Int) {
        self.medName = medName
        self.dose = dose
    }
}
class MedSurvey: Medications {
    init(){
        let medName = SurveyQuestion (text: "What's the name of your medication?")
        medName.ask()
        let med = readLine()!
        let dose = SurveyQuestion (text: "How many did you take?")
        dose.ask()
        let Dose = readLine()!
        let pDose = Int(Dose)!
        let time = SurveyQuestion (text: "What time did you take the medication? ex: 02:03 PM")
        time.ask()
        var medTime = Time(userInput: readLine()!)
        
        super.init(medName: med, dose:pDose)
    }
    
    func createMedications()->Medications {
        let medication = Medications(medName: self.medName, dose: self.dose)
        return medication
    }
}

class Time{
    var numTime: Int
    var AM: Bool
    
    init(userInput: String)
    {
        let startIndex = userInput.startIndex
        let endIndex = userInput.index(userInput.startIndex, offsetBy: 2)
        let hour = userInput[startIndex..<endIndex]
        
        let minStartIndex = userInput.index(userInput.startIndex, offsetBy: 3)
        let minEndIndex = userInput.index(userInput.startIndex, offsetBy: 5)
        let minute = userInput[minStartIndex..<minEndIndex]
        
        let meridianStartIndex = userInput.index(userInput.startIndex, offsetBy: 6)
        let meridianEndIndex = userInput.endIndex
        let meridian = userInput[meridianStartIndex..<meridianEndIndex]
        if meridian == "AM" {
             self.AM = true
        }
        else {
            self.AM = false
        }
        let hourhourhour: Int
        if self.AM == false && hour != "12" {
            let hourhour = String(hour)
            hourhourhour = Int(hourhour)! + 12
        }
        else if self.AM == true && hour == "12"{
            let hour = "00"
            let hourhour = String(hour)
            hourhourhour = Int(hourhour)!
        }
    
        else {
            let hourhour = String(hour)
            hourhourhour = Int(hourhour)!
        }
        let minuteminute = String(minute)
        let minuteminuteminute = Int(minuteminute)!
        
        self.numTime = hourhourhour*100 + minuteminuteminute
    }
    
    init(numTime: Int, AM: Bool){
        self.numTime = numTime
        self.AM = AM
    }
  
    func getTime(){
        if AM == true {
            numTime += 1200
        }
    }
    
}

func displayPrimaryMenu(){
    print("Press 1 to add a patient, press 2 to remove a patient, press 3 if you already have an account")
    let answer = readLine()
    
    if answer == "1"{
        testList.addPatient()
        displaySurveyMenu()
    }
    
    if answer == "2"{
        testList.removePatient()
        displayPrimaryMenu()
    }
    
    if answer == "3"{
        let surveyQ = SurveyQuestion (text: "What is your patient number?")
        surveyQ.ask()
        let surveyIndex = readLine()!
        let intSurveyIndex = Int(surveyIndex)!
        displaySurveyMenu()
    }
}

func displaySurveyMenu(){
    var answer2 = ""
    repeat{
        print("press 3 to see patient info, press 4 to take the pain survey, press 5 to take medication survey")
        let answer = readLine()
    
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
            let surveyQ = SurveyQuestion (text: "What is your patient number?")
            surveyQ.ask()
            let surveyIndex = readLine()!
            let intSurveyIndex = Int(surveyIndex)!
            testList.array[intSurveyIndex].addMedicationSurvey()
        }
        if answer == "6"{
            testList.savePatient()
        }
        
        print("do you want to do something else? type YES or NO")
        answer2 = readLine()!
    }
        while (answer2 == ("YES") || answer2 == ("yes"))
}
//    func displaymenu(){
//        var answer2 = "YES"
//        repeat{
//            print("press 1 for add, press 2 for remove, press 3 for query, press 4 to take the pain survey, press 5 to take medication survey")
//            let answer = readLine()
//            if answer == "1"{
//                testList.addPatient()
//            }
//            if answer == "2"{
//                testList.removePatient()
//            }
//            if answer == "3"{
//                testList.query()
//            }
//            if answer == "4"{
//                let surveyQ = SurveyQuestion (text: "What is your patient number?")
//                surveyQ.ask()
//                let surveyIndex = readLine()!
//                let intSurveyIndex = Int(surveyIndex)!
//                testList.array[intSurveyIndex].addPainSurvey()
//            }
//            if answer == "5"{
//                testList.array[0].addMedicationSurvey()
//            }
//            if answer == "6"{
//                testList.savePatient()
//            }
//
//            print("do you want to do something else? type YES or NO")
//            answer2 = readLine()!
//        }
//            while answer2 == ("YES")//add "yes"
//    }
//
