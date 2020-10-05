//
//  ViewController.swift
//  XO-CW5
//
//  Created by Mohammed Alasad on 9/28/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var TurnLabel: UILabel!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    @IBOutlet weak var B7: UIButton!
    @IBOutlet weak var B8: UIButton!
    @IBOutlet weak var B9: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    
    var counter = 0
    var Buttons:  [UIButton] = []
    @IBAction func Tap(_ sender: UIButton) {
        if counter % 2 == 0 { sender.setTitle("X", for: .normal)
            sender.setTitleColor(.gray, for: .normal)
            TurnLabel.text = "O Turn"
        }
        else { sender.setTitle("O", for: .normal)
            sender.setTitleColor(.systemRed, for: .normal)
            TurnLabel.text = "X Turn"
        }
        counter += 1
        sender.isEnabled = false
        
        winning(winner: "X")
        winning(winner: "O")
        
    }
    
    @IBAction func resetTapped() {
        restartGame()
    }
    
    func winning(winner:String)
    {
        if
B1.titleLabel?.text ==  winner && B2.titleLabel?.text == winner && B3.titleLabel?.text == winner ||
B4.titleLabel?.text == winner && B5.titleLabel?.text == winner && B6.titleLabel?.text == winner ||
B7.titleLabel?.text == winner && B8.titleLabel?.text == winner && B9.titleLabel?.text == winner ||
B1.titleLabel?.text == winner && B4.titleLabel?.text == winner && B7.titleLabel?.text == winner ||
B2.titleLabel?.text == winner && B5.titleLabel?.text == winner && B8.titleLabel?.text == winner ||
B3.titleLabel?.text == winner && B6.titleLabel?.text == winner && B9.titleLabel?.text == winner ||
B1.titleLabel?.text == winner && B5.titleLabel?.text == winner && B9.titleLabel?.text == winner ||
B3.titleLabel?.text == winner && B5.titleLabel?.text == winner && B7.titleLabel?.text == winner
    
        {
            
            print("The winner is \(winner)")
            let alertController = UIAlertController(title: "\(winner) Won🔥🧨", message: "click the button to restart!", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Play again?", style: .cancel) { [self] (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }
    }
     func restartGame()
     {
        for b in Buttons{
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
    
        }
        counter = 0
        TurnLabel.text = "X Turn"
        
     }
    
    @IBAction func musicTapped() {
        if let audioPlayer = audioPlayer, audioPlayer.isPlaying{
            musicButton.setTitle("Play", for: .normal)
            audioPlayer.stop()
        }
        else{
            musicButton.setTitle("Stop", for: .normal)
            // set up player, and play
            let urlString = Bundle.main.path(forResource: "audio", ofType: "mp3")
            do{
               try AVAudioSession.sharedInstance().setMode(.default)
try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString
                else {
                    return
                }
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                guard let audioPlayer = audioPlayer else {
                    return
                }
                audioPlayer.play()
    }
    catch{
        
    print("i really dont wanna but error")
            }
        }
    }
    override func viewDidLoad() {
        Buttons = [B1,B2,B3,B4,B5,B6,B7,B8,B9]
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

