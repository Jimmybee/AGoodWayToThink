//
//  FirstViewController.swift
//  AGoodWayToThink
//
//  Created by James Birtwell on 11/06/2017.
//  Copyright © 2017 James Birtwell. All rights reserved.
//

import UIKit

class TheGymViewController: UIViewController {

    @IBOutlet weak var healthyPerspective: UIButton!
    @IBOutlet weak var lovingConnectionsImage: UIImageView!
    @IBOutlet weak var lifeAlignedToValuesImage: UIImageView!
    @IBOutlet weak var liveNowMindfully: UIButton!
    @IBOutlet weak var gratefulMindset: UIButton!
    @IBOutlet weak var positiveThoughts: UIButton!
    
    var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewUser()
//        updateElementColours()
        buttons = [healthyPerspective, liveNowMindfully, gratefulMindset, positiveThoughts]
        
        addImageGestureTaps()
        addButtonTargets()
    }
    
    func setupNewUser() {
        let user = User.user
        for (index, elementType) in HappinessElementType.all.enumerated() {
            let element = HappinessElement(type: elementType, score: 10 * index)
            user.happinessElements.append(element)
        }
    }
    
    func updateElementColours() {
        for element in User.user.happinessElements {
            switch element.type {
            case .LovingConnections:
                lovingConnectionsImage.tintColor =  element.score > 5 ? .red : .blue
            case .HealthyPerspective:
                healthyPerspective.backgroundColor = .yellow
            default:
                liveNowMindfully.backgroundColor = .green
            }
        }
    }
    
    func addImageGestureTaps() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        lifeAlignedToValuesImage.addGestureRecognizer(gesture)
        let anotherGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        lovingConnectionsImage.addGestureRecognizer(anotherGesture)
    }
    
    func addButtonTargets() {
        buttons.forEach({ (button) in
//            button.layer.cornerRadius = 8
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.borderWidth = 1
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        })
    }
    
    func tapGesture(_ sender: UITapGestureRecognizer) {
            let tag = sender.view?.tag ?? 0
            openElementCollection(tag: tag)
    }
    
    func buttonTapped(_ sender: UIButton) {
        openElementCollection(tag: sender.tag)
    }
    
    
    func openElementCollection(tag: Int) {
        let element = HappinessElementType(rawValue: tag)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ecvc = storyboard.instantiateViewController(withIdentifier: ElementCollectionViewController.storyboardId) as! ElementCollectionViewController
        ecvc.element = element
        let nav = self.navigationController
        nav?.pushViewController(ecvc, animated: true)
    }
    

}

