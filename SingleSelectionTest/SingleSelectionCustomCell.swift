//
//  SingleSelectionCustomCell.swift
//  SingleSelectionTest
//
//  Created by 柿崎 on 2024/07/07.
//

import UIKit

class SingleSelectionCustomCell: UICollectionViewCell {
    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var leftText: UILabel!
    @IBOutlet weak var rightText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        leftText.text = ""
        rightText.text = ""
        uiImageView.image = UIImage()
    }
}

extension SingleSelectionCustomCell {
    func setupCell(imageName: String, left: String, right: String) {
        leftText.text = left
        rightText.text = right
        uiImageView.image = UIImage(named: imageName)
    }
}
