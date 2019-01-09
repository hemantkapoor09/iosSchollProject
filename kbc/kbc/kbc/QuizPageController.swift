import UIKit
struct Question
{
    var Question : String!
    var Options: [String]!
    var Answer: String!
}

class QuizPageController: UIViewController {

    @IBOutlet weak var QuestionL: UILabel!
    @IBOutlet var Options: [UIButton]!
    @IBOutlet weak var nxtButton: UIButton!
    @IBOutlet weak var showResult: UIButton!
    @IBOutlet weak var questinNo: UILabel!
    
    var AllQuestions:[Question] = []
    var QNumber: Int = 0
    var selectedAswer = ""
    var ans:String!
    var rightCount = 0
    var wrongCount = 0
    var questionCounter = 0
    var screenCount = 0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        showResult.isHidden = true
       
        AllQuestions = [
            Question(Question: "The most widely used computer device is.", Options: ["Solid state disks", "External hard disk", "Internal hard disk", "Mouse"], Answer: "Internal hard disk"),
            Question(Question: "____ are software which is used to do particular task.", Options: ["Operating system", "Program", "Data", "Software"], Answer: "Program"),
            Question(Question: "Which of the following produces high-quality output?", Options: ["Impact printer", "Non-impact printer", "Plotter", "Both '1' and '2'"], Answer: "Non-impact printer"),
            Question(Question: "The pattern of printed lines on most products are called", Options: ["prices", "OCR", "scanners", "bar code"], Answer: "bar code"),
            Question(Question: "Which one of the following can not be scheduled by the kernel?", Options: ["process", "kernel level thread", "user level thread", "none of these"], Answer: "user level thread"),
            Question(Question: "In priority scheduling algorithm", Options: ["CPU is allocated to the process with highest priority", "CPU is allocated to the process with lowest priority", "Equal priority processes can not be scheduled", "None of these"], Answer: "CPU is allocated to the process with highest priority"),
            Question(Question: "TWhat is operating system?", Options: ["collection of programs that manages hardware resources", "system service provider to the application programs", "link to interface the hardware and application programs", "All of the above"], Answer: "All of the above"),
            Question(Question: "The OS X has _____", Options: ["monolithic kernel", "hybrid kernel", "microkernel", "monolithic kernel with modules"], Answer: "hybrid kernel"),
            Question(Question: "A system is in the safe state if", Options: ["the system can allocate resources to each process in some order and still avoid a deadlock", "there exist a safe sequence", "all of the mentioned", "none of the mentioned"], Answer: "the system can allocate resources to each process in some order and still avoid a deadlock"),
            Question(Question: "A problem encountered in multitasking when a process is perpetually denied necessary resources is called", Options: ["deadlock", "starvation", "inversion", "aging"], Answer: "starvation")
                       ]
        selectQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func selectQuestion()
    {
        var msg = ""
        msg = "Qusetion Number: \(String(questionCounter + 1))"
        questinNo.text = msg
        nxtButton.isHidden = true
        setingUIToDefault()
        if AllQuestions.count>0
        {   let total = AllQuestions.count
            QNumber = Int(arc4random_uniform(UInt32(total)))
            QuestionL.text = AllQuestions[QNumber].Question
            selectedAswer = AllQuestions[QNumber].Answer
            for h in 0..<Options.count
            {
                Options[h].setTitle(AllQuestions[QNumber].Options[h], for: UIControlState.normal)
            }
            AllQuestions.remove(at: QNumber)
        }
        
    }

    @IBAction func option1(_ sender: Any)
    {
       ans = Options[0].titleLabel?.text
        Options[0].backgroundColor = UIColor.yellow        
        Options[1].isEnabled = false
           Options[1].backgroundColor = UIColor.cyan
        Options[2].isEnabled = false
           Options[2].backgroundColor = UIColor.cyan
        Options[3].isEnabled = false
           Options[3].backgroundColor = UIColor.cyan
        validate()
    } 
    
    @IBAction func option2(_ sender: Any)
    {
        ans = Options[1].titleLabel?.text
        Options[1].backgroundColor = UIColor.yellow
        Options[0].isEnabled = false
           Options[0].backgroundColor = UIColor.cyan
        Options[2].isEnabled = false
           Options[2].backgroundColor = UIColor.cyan
        Options[3].isEnabled = false
           Options[3].backgroundColor = UIColor.cyan
        validate()
    }
    @IBAction func option3(_ sender: Any)
    {
        ans = Options[2].titleLabel?.text
        Options[2].backgroundColor = UIColor.yellow
        Options[0].isEnabled = false
           Options[0].backgroundColor = UIColor.cyan
        Options[1].isEnabled = false
           Options[1].backgroundColor = UIColor.cyan
        Options[3].isEnabled = false
           Options[3].backgroundColor = UIColor.cyan
        validate()
    }
    @IBAction func option4(_ sender: Any)
    {
        ans = Options[3].titleLabel?.text
        Options[3].backgroundColor = UIColor.yellow
        Options[0].isEnabled = false
           Options[0].backgroundColor = UIColor.cyan
        Options[1].isEnabled = false
           Options[1].backgroundColor = UIColor.cyan
        Options[2].isEnabled = false
           Options[2].backgroundColor = UIColor.cyan
        validate()
    }
    func validate()
    {
        questionCounter += 1
        
        if(ans == selectedAswer)
        {
         rightCount = rightCount + 1
            NSLog("rightCount = \(rightCount)")
        }
        else
        {
            wrongCount = wrongCount + 1
            NSLog("wrongCount = \(wrongCount)")
        }
        
        nxtButton.isHidden = false
    }
    func setingUIToDefault()
    {
        Options[0].isEnabled = true
            Options[0].backgroundColor = UIColor.white
        Options[1].isEnabled = true
            Options[1].backgroundColor = UIColor.white
        Options[2].isEnabled = true
            Options[2].backgroundColor = UIColor.white
        Options[3].isEnabled = true
            Options[3].backgroundColor = UIColor.white
    }
    
    @IBAction func nextButton(_ sender: Any)
    {
        if(screenCount < 4)
        {
            screenCount += 1
            selectQuestion()
        }
        else
        {
            showResult.isHidden = false
        }
    }
    @IBAction func showResult(_ sender: Any)
    {
        if(screenCount == 4)
        {
            performSegue(withIdentifier: "segScore", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let resultcont = segue.destination as! resultScreenController
        resultcont.scoree = rightCount
    }
    
}
