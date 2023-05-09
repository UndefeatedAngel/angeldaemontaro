//
//  File.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 27.03.23.
//

import UIKit

class AngelNumbersCollectionViewController: UIViewController {
    private let segue = "angelNumbersDescriptionSegue"
    let angelNumbers = AngelNumbersCardsDayModel()
    var numberSection = 0
    var numberRow = 0
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = R.angelsMenu
        
        collectionView.backgroundView = UIImageView(image: UIImage(named: "background"))
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        setupGestureTabBar()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let descruptionController = segue.destination as? AngelNumbersDescriptionViewController {
            descruptionController.json = self.angelNumbers.content?[numberSection].cards[numberRow]
        }
    }
    
    func getImage(numberSection: Int, numberKey: Int) -> UIImage? {
        let imageName = angelNumbers.content?[numberSection].cards[numberKey].image ?? ""
        return UIImage(named: imageName)
    }
}

extension AngelNumbersCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        numberSection = indexPath.section
        numberRow = indexPath.row
        performSegue(withIdentifier: segue, sender: self)
    }
}

extension AngelNumbersCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return angelNumbers.content?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return angelNumbers.content?[section].cards.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AngelNumbersCollectionViewCell.reuseID,
                                                         for: indexPath) as? AngelNumbersCollectionViewCell {
            cell.angelNumbersImageView?.image = getImage(numberSection: indexPath.section, numberKey: indexPath.row)
            cell.contentView.clipsToBounds = true
            cell.contentView.layer.cornerRadius = 10
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(
        _ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath) -> UICollectionReusableView {
            
        if let sectionHeader =
            collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                            withReuseIdentifier: AngelNumbersSectionReusableView.reuseID,
                                                            for: indexPath) as? AngelNumbersSectionReusableView {
            sectionHeader.label.text = getLocale(key: angelNumbers.content?[indexPath.section].title ?? "")
            return sectionHeader
        }
        return UICollectionReusableView()
    }
}
