//
//  LovingConnectionsViewController.swift
//  AGoodWayToThink
//
//  Created by James Birtwell on 11/06/2017.
//  Copyright © 2017 James Birtwell. All rights reserved.
//

import UIKit

class ElementCollectionViewController: UIViewController {
    
    static var storyboardId = "ElementCollectionViewController"
    var element: HappinessElementType!
    
    @IBOutlet weak var elementCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = element.navTitle
        elementCollectionView.delegate = self
        elementCollectionView.dataSource = self
    }

}

extension ElementCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
}
