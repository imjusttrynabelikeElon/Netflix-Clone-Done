//
//  HomeScreen.swift
//  Netflix Clone
//
//  Created by Karon Bell on 4/26/23.
//

import Foundation
import UIKit
import SwiftyGif
import AVKit
import AVFAudio
import AVFoundation

/*
 MainTabBarViewController()
 */
class homeScreen: UIViewController, SwiftyGifDelegate {
    
   
    @IBOutlet weak var pacManGif: UIImageView!
    
    
    var aaPlayer: AVAudioPlayer?
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    



        // Change the background color to black
        view.backgroundColor = .systemPink
        
        if let path = Bundle.main.path(forResource: "introSound", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                aaPlayer = try AVAudioPlayer(contentsOf: url)
                aaPlayer?.volume = 1
                aaPlayer?.play()
                // aaPlayer?.numberOfLoops = -1 makes sure the theme song plays as long as the game is playing.
                
            } catch {
                print("Error loading audio file")
            }
        }
        
        guard let pacManGif = self.pacManGif else {
            print("self.pacManGif is nil")
            return
        }
        pacManGif.delegate = self
  
        do {
            let image = try UIImage(gifName: "introoo")
            self.pacManGif.setGifImage(image, loopCount: -1)
            self.pacManGif.startAnimatingGif()
        } catch {
            // Handle the error
            print("Error loading image: \(error)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let speechUtterance = AVSpeechUtterance(string: "welcome to this Netfilx Clone")
        self.synthesizer.speak(speechUtterance)
    
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "viewControllerr") as! HomeViewController
                
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: {
                    // Remove homeScreen as the parent view controller
                    self.removeFromParent()
                    self.view.removeFromSuperview()
                    if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
                       let window = windowScene.windows.first {
                        // Do something with the window
                        self.aaPlayer?.stop()
                    }
                })
            }
        
    
    

    
    func gifDidStop(sender: UIImageView) {
        print("gifDidStop")
    }
    
    func gifDidStart(sender: UIImageView) {
        print("gifDidStart")
    }
    
    func gifDidLoop(sender: UIImageView) {
        print("gifDidLoop")
    }
    
    func gifURLDidFail(sender: UIImageView, url: URL, error: Error?) {
        print("gifURLDidFail")
    }
    
    func gifURLDidFinish(sender: UIImageView) {
        print("gifURLDidFinish")
    }
}

