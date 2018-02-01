//
//  CollectionViewController.swift
//  CatVsDog
//
//  Created by Mathieu Vandeginste on 20/01/2018.
//  Copyright © 2018 LibertyRider. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    weak var vc: ViewController?

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pic", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.image.image = UIImage(named: "\(indexPath.row).jpg")
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.vc?.imageView.image = UIImage(named: "\(indexPath.row).jpg")
        self.navigationController?.popToRootViewController(animated: true)
    }

}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
}
