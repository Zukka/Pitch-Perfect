//
//  RecordSoundsViewController.swift
//  prova
//
//  Created by Alessandro Bellotti on 19/04/17.
//  Copyright © 2017 Alessandro Bellotti. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
 // MARK: Properties
    var alertFailRecord :UIAlertController? // for alert view
    
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparaUI(stato: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func recordAudio(_ sender: AnyObject) {
        preparaUI(stato: true)
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playAndRecord)), options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()

    }

    @IBAction func stopRecording(_ sender: Any) {
        preparaUI(stato: false)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func preparaUI (stato: Bool) {
        recordingLabel.text = stato ? "Recording in Progress" : "Tap to Record"
        stopRecordingButton.isEnabled = stato
        recordButton.isEnabled = !stato
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            
            alertFailRecord = UIAlertController(title: "Pitch Perfect - Alert",
                                           message: "Recording not was successful",
                                           preferredStyle: .alert)
            // Add action for close alert view
            let action = UIAlertAction(title: "Close", style: UIAlertAction.Style.default,
                                       handler: {(paramAction :UIAlertAction!) in
                                        
            })
            alertFailRecord!.addAction(action)

            present(alertFailRecord!, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            //            My version of segue
            (segue.destination as! PlaySoundsViewController).recordedAudioURL = sender as? URL
        }
    }
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
