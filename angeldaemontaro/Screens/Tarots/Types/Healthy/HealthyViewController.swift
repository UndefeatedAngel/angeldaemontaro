//
//  HealthyViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 13.08.22.
//

import UIKit

class HealthyViewController: BaseTarotViewController {
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    @IBOutlet weak var imageView9: UIImageView!
    @IBOutlet weak var imageView10: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayViews.append(imageView1)
        arrayViews.append(imageView2)
        arrayViews.append(imageView3)
        arrayViews.append(imageView4)
        arrayViews.append(imageView5)
        arrayViews.append(imageView6)
        arrayViews.append(imageView7)
        arrayViews.append(imageView8)
        arrayViews.append(imageView9)
        arrayViews.append(imageView10)
    }
}
