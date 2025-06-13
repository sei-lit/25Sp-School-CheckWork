import UIKit

class ResultViewController: UIViewController {
    
    var timerCount: Double = 0.0
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - ViewControllerから渡されたタイマーのカウントをラベルに表示する
        resultLabel.text = String(format: "%.1f", timerCount) + "秒"
    }
}
