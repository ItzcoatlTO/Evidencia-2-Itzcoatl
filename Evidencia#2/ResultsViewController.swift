

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult(){
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map{ $0.type}
        for response in responseTypes{
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0 + 1)
        }
        
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by: {
            (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswerSorted.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
}
