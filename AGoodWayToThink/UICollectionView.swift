//
//  UICollectionView.swift
//  easySwitch
//
//  Created by James Birtwell on 27/04/2017.
//  Copyright © 2017 Warmup. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerNibCellWithNameAndId(_ id: String) {
        self.register(UINib(nibName: id, bundle: Bundle.main), forCellWithReuseIdentifier: id)
    }
}
