//
//  ViewController.swift
//  Project 4
//
//  Created by Garrett Li on 6/15/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateMoodLabel()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateMoodLabel()
    }

    @IBAction func saveMoodTapped(_ sender: UIButton) {
        saveMood()
    }

    func updateMoodLabel() {
        let value = Int(moodSlider.value)
        var moodText = ""
        var emoji = ""

        switch value {
        case 0...20:
            moodText = "Very Sad"
            emoji = "😢"
        case 21...40:
            moodText = "Sad"
            emoji = "🙁"
        case 41...60:
            moodText = "Neutral"
            emoji = "😐"
        case 61...80:
            moodText = "Happy"
            emoji = "🙂"
        case 81...100:
            moodText = "Very Happy"
            emoji = "😄"
        default:
            moodText = "Unknown"
            emoji = "❓"
        }

        moodLabel.text = "\(moodText) \(emoji)"
    }

    func saveMood() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium

        let selectedDate = formatter.string(from: datePicker.date)
        let moodDescription = moodLabel.text ?? ""

        resultLabel.text = "On \(selectedDate), you felt \(moodDescription)"
    }
}


