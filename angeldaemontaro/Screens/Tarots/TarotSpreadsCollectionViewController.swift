//
//  TarotSpreadsViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

class TarotSpreadsCollectionViewController: UICollectionViewController {
    let segue = "tarotSegue"
    let tarotSpreads = TarotSpreadModel()
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = R.tarotSpreadsMenu
        
        collectionView.backgroundView = UIImageView(image: Assets.Images.background.image)
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let container = segue.destination as? TarotContainerViewController {
            container.content = tarotSpreads.contents?[selectedIndex]
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tarotSpreads.contents?.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: segue, sender: self)
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TarotSpreadsCell.reuseID, for: indexPath) as? TarotSpreadsCell {
            guard let tarot = tarotSpreads.contents?[indexPath.row] else { return cell }
            let image = UIImage(named: tarot.image)
            cell.imageView.image = image
            cell.labelView.text = getLocale(key: tarot.title)
            cell.contentView.backgroundColor = .clear

            return cell
        }
        
        return UICollectionViewCell()
    }
}
