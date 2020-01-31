//
//  ViewController.swift
//  Slider
//
//  Created by swiftneko on 2020/1/31.
//  Copyright © 2020 swiftneko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var label: UILabel!
    
    private var lastValue: Int = 20
    @IBAction func onSliderValueChanged(_ sender: UISlider) {
        // min 14
        // max 26
        // step 2
        // 14 16 18 20 22 24 26
        let step: Float = 2.0
        // 15.5 - 14 = 1.5
        // 1.5 / 2 = 0.75
        // round(0.75) = 1
        // 1 * 2 = 2
        // 14 + 2 = 16
        // 15.5 => 16
        let value = Int(sender.minimumValue + round((sender.value - sender.minimumValue) / step) * step)
        sender.value = Float(value)
        label.font = UIFont.systemFont(ofSize: CGFloat(value))

        if lastValue != value {
            feedbackGenerator.selectionChanged()
            lastValue = value
        }
    }
    
    private let feedbackGenerator = UISelectionFeedbackGenerator()
}

