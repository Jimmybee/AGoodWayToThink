//
//  OnboardingIntroViewController.swift
//  AGoodWayToThink
//
//  Created by James Birtwell on 18/06/2017.
//  Copyright © 2017 James Birtwell. All rights reserved.
//

import UIKit

class OnboardingIntroViewController: UIViewController {

    static var storyboardId = "OnboardingIntroViewController"
    static func storyboardInit() -> UIViewController {
        return UIStoryboard.mainViewControllerWith(id: storyboardId)
    }
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapOnView(_ sender: Any) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        UIView.animate(withDuration: 0.3) {
            self.stackView.alpha = 0
        }
    }

    

}
