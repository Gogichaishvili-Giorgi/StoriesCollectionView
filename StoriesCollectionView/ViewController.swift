//
//  ViewController.swift
//  StoriesCollectionView
//
//  Created by Giorgi Gogichaishvili on 10/28/20.
//  Copyright © 2020 giorgi gogichaishvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var collectionView: UICollectionView?
    private let models = ["singer1", "singer2", "singer3", "singer1", "singer2", "singer3", "singer1", "singer2", "singer3", "singer1", "singer2", "singer3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identifier)
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        guard let myCollection = collectionView else {
            return
        }
        view.addSubview(myCollection)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 150).integral
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identifier, for: indexPath) as! CircleCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
}

