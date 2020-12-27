//
// Created by Reza Khonsari on 12/27/20.
// Copyright © 2020 risoapps. All rights reserved.

// Linkedin: https://www.linkedin.com/in/rezakhonsari-ios/
// Github: https://github.com/rezamagnet
//  

import UIKit
import MobileCoreServices

class ViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidTouch(_ sender: UIButton) {
        let cameraPickerViewController = UIImagePickerController()
        cameraPickerViewController.delegate = self
        cameraPickerViewController.sourceType = .camera
        cameraPickerViewController.mediaTypes = [kUTTypeMovie as String]
        cameraPickerViewController.videoQuality = .typeMedium
        self.present(cameraPickerViewController, animated: true)
    }
    
}


extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker.sourceType == .camera,
           let videoURL = info[.mediaURL] as? URL {
            
            encodeVideo(at: videoURL) { (url, error) in
                print(url)
                print(error)
            }

        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.presentingViewController?.dismiss(animated: true)
    }

}

