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
            if (patient.firstName == fullName!) {
                print("Patient Name: \(patient.lastName), \(patient.firstName)")
//            print(patient.patientstring())
            if (patient.name == fullName!) {
                print("Patient Name: \(patient.name)")
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
        let firstNameQuestion = SurveyQuestion (text: "What is your first name?")
        firstNameQuestion.ask()
        let FirstName = readLine()!
        let filepath1 = "/Users/2020alexish/workspace/pain_project/TestTextBasedAppVersion2/TestTextBasedAppVersion2/test.xml"
        let filemgr = FileManager.default
        let databuffer = filemgr.contents(atPath: filepath1)

        //gives each patient a patient #
        
        //create new file
        filemgr.createFile(atPath: filepath1, contents: databuffer, attributes: nil)
        
        
        //writes in file testtest
        let date = NSDate()
        let qfile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if qfile == nil {
            print("File open failed")
        } else {
            let data = ("Creation Date: \(date)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            qfile?.seek(toFileOffset: 0)
            qfile?.write(data!)
            qfile?.closeFile()
        }
        
       
        let file: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if file == nil {
            print("File open failed")
        } else {
            let data = ("\nFirst Name: \(FirstName) " as
                NSString).data(using: String.Encoding.utf8.rawValue)
            file?.seek(toFileOffset: 40)
            file?.write(data!)
            file?.closeFile()
        }
        
        
        let lastNameQuestion = SurveyQuestion (text: "What is your last name?")
        lastNameQuestion.ask()
        let LastName = readLine()!
        let afile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if afile == nil {
            print("File open failed")
        } else {
            let data = ("\nLast Name: \(LastName)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            afile?.seek(toFileOffset: UInt64(53 + FirstName.count))
            afile?.write(data!)
            afile?.closeFile()
        }
        
        let genderQuestion = SurveyQuestion (text: "What is your gender?")
        genderQuestion.ask()
        let Gender = readLine()!
        let bfile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if bfile == nil {
            print("File open failed")
        } else {
            let data = ("\nGender: \(Gender) " as
                NSString).data(using: String.Encoding.utf8.rawValue)
            bfile?.seek(toFileOffset: UInt64(53 + FirstName.count + 12 + LastName.count))
            bfile?.write(data!)
            bfile?.closeFile()
        }
        
        
        let physicianQuestion = SurveyQuestion (text: "Who is your doctor?")
        physicianQuestion.ask()
        let Physician = readLine()!
        let cfile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if cfile == nil {
            print("File open failed")
        } else {
            let data = ("\nPhysician: \(Physician) " as
                NSString).data(using: String.Encoding.utf8.rawValue)
            cfile?.seek(toFileOffset: UInt64(53 + FirstName.count + 12 + LastName.count + 9 + Gender.count))
            cfile?.write(data!)
            cfile?.closeFile()
        }
        
        
        let DOBquestion = SurveyQuestion (text: "When is your birthday? Enter MM/DD/YYYY")
        DOBquestion.ask()

        let DateOfBirth = readLine()!
        let DOBArray = DateOfBirth.split(separator: "/", maxSplits: 3)
        let month = DOBArray[0]
        let day = DOBArray[1]
        let year = DOBArray[2]
        let birthday = year + month + day
        let DOB = Int(birthday)!
        let dfile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if dfile == nil {
            print("File open failed")
        } else {
            let data = ("\nDate Of Birth: \(DateOfBirth) " as
                NSString).data(using: String.Encoding.utf8.rawValue)
            dfile?.seek(toFileOffset: UInt64(53 + FirstName.count + 12 + LastName.count + 9 + Gender.count + 12 + Physician.count))
            dfile?.write(data!)
            dfile?.closeFile()
        }
        
        let surgeryTypeQuestion = SurveyQuestion (text: "What kind of surgery?")
        surgeryTypeQuestion.ask()
        let SurgType = readLine()!
        let efile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if efile == nil {
            print("File open failed")
        } else {
            let data = ("\nSurgery Type: \(SurgType)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            efile?.seek(toFileOffset: UInt64(53 + FirstName.count + 12 + LastName.count + 9 + Gender.count + 12 + Physician.count+26))
            efile?.write(data!)
            efile?.closeFile()
        }
        let fileLength = (53 + FirstName.count + 12 + LastName.count + 9 + Gender.count + 12 + Physician.count+26)
        print(fileLength)

       
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
        var filepath1 = "/Users/2020alexish/workspace/pain_project/TestTextBasedAppVersion2/TestTextBasedAppVersion2/A"
        let filemgr = FileManager.default
        let databuffer = filemgr.contents(atPath: filepath1)
        

        let date = NSDate()
        let file: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if file == nil {
            print("File open failed")
        } else {
            let data = ("\nSurvey Date and Time: \(date)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            file?.seek(toFileOffset: 80)
            file?.write(data!)
            file?.closeFile()
        }
        
        let place = SurveyQuestion (text: "Where does it hurt?")
        place.ask()
        let Place = readLine()!
        //adds pain level to file
        let afile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if afile == nil {
            print("File open failed")
        } else {
            let data = ("\nLocation of Pain: \(Place)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            afile?.seek(toFileOffset: UInt64(150))
            afile?.write(data!)
            afile?.closeFile()
        }
        
        let level = SurveyQuestion (text: "What is your pain level on a scale of 1-5?")
        level.ask()
        let Level = readLine()!
        let pLevel = Int(Level)!
        let bfile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if bfile == nil {
            print("File open failed")
        } else {
            let data = ("\nPain Level: \(Level)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            bfile?.seek(toFileOffset: UInt64(169 + Place.count))
            bfile?.write(data!)
            bfile?.closeFile()
        }
    
        let symptoms = SurveyQuestion (text: "What are your symptoms")
        symptoms.ask()
        
        let Symptoms = readLine()!
        
        let cfile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if cfile == nil {
            print("File open failed")
        } else {
            let data = ("\nSymptoms: \(Symptoms)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            cfile?.seek(toFileOffset: UInt64(182 + Place.count))
            cfile?.write(data!)
            cfile?.closeFile()
        }
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
        var filepath1 = "/Users/2020alexish/workspace/pain_project/TestTextBasedAppVersion2/TestTextBasedAppVersion2/A"
        let filemgr = FileManager.default
        let databuffer = filemgr.contents(atPath: filepath1)
        
        let date = NSDate()
        let file: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if file == nil {
            print("File open failed")
        } else {
            let data = ("\nSurvey Date and Time: \(date)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            file?.seek(toFileOffset: 80)
            file?.write(data!)
            file?.closeFile()
        }
        
        let medName = SurveyQuestion (text: "What's the name of your medication?")
        medName.ask()
        let med = readLine()!
        
        let hfile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if hfile == nil {
            print("File open failed")
        } else {
            let data = ("\nMedication: \(med)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            hfile?.seek(toFileOffset: 300)
            hfile?.write(data!)
            hfile?.closeFile()
        }
        
        let dose = SurveyQuestion (text: "How many did you take?")
        dose.ask()
        let Dose = readLine()!
        let pDose = Int(Dose)!
        
        let afile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if afile == nil {
            print("File open failed")
        } else {
            let data = ("\nDosage: \(Dose)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            afile?.seek(toFileOffset: UInt64(300 + med.count))
            afile?.write(data!)
            afile?.closeFile()
        }
        
        let time = SurveyQuestion (text: "What time did you take the medication? ex: 02:03 PM")
        time.ask()
        var medTime = Time(userInput: readLine()!)
        
        let dfile: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
        if dfile == nil {
            print("File open failed")
        } else {
            let data = ("\nTime of Ingestion: \(medTime)" as
                NSString).data(using: String.Encoding.utf8.rawValue)
            dfile?.seek(toFileOffset: UInt64(300 + med.count + Dose.count))
            dfile?.write(data!)
            dfile?.closeFile()
        }
        
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
                if filemgr.fileExists(atPath: "/Users/2020alexish/workspace/pain_project/TestTextBasedAppVersion2/TestTextBasedAppVersion2/testtest.txt") {
                    print("File exists")
                } else {
                    print("File not found")
                }
                //reads file testtest
                let filepath1 = "/Users/2020alexish/workspace/pain_project/TestTextBasedAppVersion2/TestTextBasedAppVersion2/testtest.txt"
                let databuffer = filemgr.contents(atPath: filepath1)
                print(String(data: databuffer!, encoding: .utf8)!)
               //writes in file testtest
//                let file: FileHandle? = FileHandle(forUpdatingAtPath: filepath1)
//                if file == nil {
//                    print("File open failed")
//                } else {
//                    let data = ("black dog" as
//                        NSString).data(using: String.Encoding.utf8.rawValue)
//                    file?.seek(toFileOffset: 12)
//                    file?.write(data!)
//                    file?.closeFile()
//                }
            }
            print("do you want to do something else? type YES or NO")
            answer2 = readLine()!
        }
            while answer2 == "YES"
        if answer2 == "6" {
            print("no")
        }
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
        }
    
    
    if answer == "1"{
        testList.addPatient()
        displaymenu()
    }
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
