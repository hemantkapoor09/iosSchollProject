import UIKit

class resultScreenController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var rPlay: UIButton!
    var scoree = 0
    var correct = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rPlay.isHidden = true
        correct = "\(scoree)/5"
        score.text = correct
        var messageToDisplay = ""
        if(scoree < 3)
        {
            messageToDisplay = "Please try again!"
            rPlay.isHidden = false
        }
        else if(scoree < 4)
        {
            messageToDisplay = "Good job!"
        }
        else if(scoree < 5)
        {
            messageToDisplay = "Exellent work!"
        }
        else if(scoree == 5)
        {
            messageToDisplay = "You are a genius!"
        }
        message.text = messageToDisplay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func replay(_ sender: Any)
    {
        
    }
    
}
