//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Zaki Zughbi on 9/28/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total = "0.0"
    var splitSettings = 2
    var tipSettings = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = total
        settingsLabel.text = "Split between \(splitSettings), with \(tipSettings)% tip."
    }
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
