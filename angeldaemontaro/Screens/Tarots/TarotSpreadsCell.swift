//
//  TarotSpreadsCell.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

import UIKit

class TarotSpreadsCell: UICollectionViewCell {
    static let reuseID = "taroSpreadCell"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var textCountView: UILabel!
    @IBOutlet weak var countView: UIView!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
