//
//  ViewController.swift
//  SingleSelectionTest
//
//  Created by 柿崎 on 2024/07/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let selectionModes = [
        ["surveyDailyGoalsUncheckedButton", "10分/日", "カジュアル"],
        ["surveyDailyGoalsUncheckedButton", "20分/日", "普通"],
        ["surveyDailyGoalsUncheckedButton", "30分/日", "ハード"],
        ["surveyDailyGoalsUncheckedButton", "1時間/日", "超ハード"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SingleSelectionCustomCell", bundle: nil), forCellWithReuseIdentifier: "SingleSelectionCustomCell")

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width - 24 , height: 46)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        collectionView.collectionViewLayout = layout
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectionModes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleSelectionCustomCell", for: indexPath)

        if let cell = cell as? SingleSelectionCustomCell {
            cell.setupCell(imageName: selectionModes[indexPath.row][0], left: selectionModes[indexPath.row][1], right: selectionModes[indexPath.row][2])
        }

        return cell
    }
}
