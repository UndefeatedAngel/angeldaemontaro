//
//  TarotSpreadsViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

class TarotSpreadsCollectionViewController: UIViewController {
    
    let segue = "tarotSegue"
    let tarotSpreads = TarotSpreadModel()
    var selectedIndex: Int = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = getLocale(key: "tarotSpreadsMenu")
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let container = segue.destination as? TarotContainerViewController {
            container.content = tarotSpreads.contents?[selectedIndex]
        }
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
}

extension TarotSpreadsCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: segue, sender: self)
    }
}

extension TarotSpreadsCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tarotSpreads.contents?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TarotSpreadsCell.reuseID, for: indexPath) as? TarotSpreadsCell {
            guard let tarot = tarotSpreads.contents?[indexPath.row] else { return cell }
            let image = UIImage(named: tarot.image)
            cell.imageView.image = image
            cell.labelView.text = getLocale(key: tarot.title)
            cell.contentView.backgroundColor = .clear
            cell.contentView.clipsToBounds = true
            cell.contentView.layer.cornerRadius = 10

            return cell
        }
        
        return UICollectionViewCell()
    }
}
