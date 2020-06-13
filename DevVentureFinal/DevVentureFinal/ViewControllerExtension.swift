//
//  UIViewControllerExtension.swift
//  DevVentureFinal
//
//  Created by Caio  Marastoni on 13/06/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let square = (collectionView.frame.width-8) / 3
        return CGSize(width: square, height: square)
        
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let image = UIImage(named: items[indexPath.row])
        let cellImage = UIImageView(image: image)
        cellImage.contentMode = .scaleAspectFill
        cell.contentView.addSubview(cellImage)
        cell.contentView.clipsToBounds = true
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 4).isActive = true
        cellImage.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 4).isActive = true
        cellImage.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -4).isActive = true
        cellImage.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -4).isActive = true
        return cell
    }
}
