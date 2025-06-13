import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    var timer: Timer!
    var timerCount: Double = 0.0
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        plusButton.layer.cornerRadius = 40
        setTimer()
    }
    
    // MARK: - プラスボタンがタップされたときの処理
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        // MARK: - タップされたら数字を1増やしてラベルに表示する
        number += 1
        numberLabel.text = "\(number)"
        
        // MARK: - 15回以上タップされたらタイマーを止めてResultViewControllerに遷移する
        if number >= 15 {
            if timer.isValid {
                timer.invalidate()
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultViewController = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            resultViewController.modalPresentationStyle = .fullScreen
            resultViewController.timerCount = timerCount
            present(resultViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Timerの設定をするところ
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    // MARK: - タイマーが発火したときの処理
    @objc func timerFired() {
        timerCount += 0.1
    }
}

