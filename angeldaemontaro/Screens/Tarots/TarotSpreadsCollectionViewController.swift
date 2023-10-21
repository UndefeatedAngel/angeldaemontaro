//
//  TarotSpreadsViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 15.07.22.
//

import UIKit

class TarotSpreadsCollectionViewController: UIViewController {
    let maxCount = 10
    
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
        
        AdsManager.shared.loadRewarded()
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
        guard let tarot = tarotSpreads.contents?[selectedIndex] else { return }
        
        let count = AdsData.getRewardType(type: tarot.key)
        if count >= maxCount {
            AdsManager.shared.showReward(self, count: maxCount, key: tarot.key) {[weak self] in
                self?.collectionView.reloadData()
            }
        } else {
            AdsData.setRewardType(type: tarot.key, count: count + 1)
            performSegue(withIdentifier: segue, sender: self)
        }
        
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
            
            cell.contentView.clipsToBounds = true
            cell.contentView.layer.cornerRadius = 10
            
            cell.countView.clipsToBounds = true
            cell.countView.layer.cornerRadius = 10
            cell.countView.backgroundColor = .red
            let count = maxCount - AdsData.getRewardType(type: tarot.key)
            cell.textCountView.text = "\(count)"

            let isDark = traitCollection.userInterfaceStyle == .dark
            cell.labelView.textColor = isDark ? .white : .black
            
            cell.contentView.alpha = count < 1 ? 0.5 : 1
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
