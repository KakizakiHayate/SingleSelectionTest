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
        collectionView.delegate = self
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
            cell.layer.borderWidth = 0 // 再利用時にボーダーをリセット
            cell.layer.cornerRadius = 10 // 角丸をリセット
            cell.layer.masksToBounds = true
            cell.backgroundColor = .white
        }

        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SingleSelectionCustomCell {
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.blue.cgColor
            cell.layer.cornerRadius = 10 // 角丸を設定
            cell.layer.masksToBounds = true
            cell.backgroundColor = UIColor.green // 背景色を緑に設定
            cell.updateImage(imageName: "surveyDailyGoalsCheckButton") // 画像を切り替え
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SingleSelectionCustomCell {
            cell.layer.borderWidth = 0 // 選択解除時にボーダーをリセット
            cell.layer.cornerRadius = 10 // 角丸をリセット
            cell.layer.masksToBounds = true
            cell.backgroundColor = .white // 背景色を白にリセット
            cell.updateImage(imageName: selectionModes[indexPath.row][0]) // 元の画像に戻す
        }
    }
}
