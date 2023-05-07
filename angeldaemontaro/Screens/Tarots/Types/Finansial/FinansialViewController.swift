//
//  FinansialViewController.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 7.08.22.
//

import UIKit

class FinansialViewController: BaseTarotViewController {
    // переменные элементов на экране
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayViews.append(imageView1)
        arrayViews.append(imageView2)
        arrayViews.append(imageView3)
        arrayViews.append(imageView4)
    }
}
