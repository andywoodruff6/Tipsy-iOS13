//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Andy W on 1/28/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var billTotalLabel: String?
    var tipPctLabel: String?
    var numGuestsLabel: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = billTotalLabel
        settingsLabel.text = "Split between \(numGuestsLabel ?? "0") people, with a \(tipPctLabel ?? "0") tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
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
