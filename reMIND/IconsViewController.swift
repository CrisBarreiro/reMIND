//
//  IconsViewController.swift
//  reMIND
//
//  Created by Cristina Sánchez Barreiro on 15/12/2017.
//  Copyright © 2017 CrisBarreiro. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class IconsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var iconsList : [[String : String]] = [[String : String]]()
    var icons : Array<String> = Array<String>()
    var headerTitleString : String?
    var selectedTask : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconsList.append(["icon": "img_icono_compra", "title": "Shopping"])
        iconsList.append(["icon": "img_icono_economia", "title": "Economy"])
        iconsList.append(["icon": "img_icono_amor", "title": "Love"])
        iconsList.append(["icon": "img_icono_amigos", "title": "Friends"])
        iconsList.append(["icon": "img_icono_lugares", "title": "Places"])
        iconsList.append(["icon": "img_icono_fechas", "title": "Dates"])
        iconsList.append(["icon": "img_icono_webs", "title": "Webs"])
        iconsList.append(["icon": "img_icono_archivos", "title": "Files"])
        iconsList.append(["icon": "img_icono_musica", "title": "Music"])
        iconsList.append(["icon": "img_icono_vacaciones", "title": "Holydays"])
        iconsList.append(["icon": "img_icono_ideas", "title": "Ideas"])
        iconsList.append(["icon": "img_icono_deportes", "title": "Sports"])
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let iconCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath)
        let icon = iconsList[indexPath.row]
        
        if let iconCell = iconCell as? IconCell {
            if let icon = icon["icon"] {
                iconCell.icon.image = UIImage(named: icon)
            }
            if let title = icon["title"] {
                iconCell.title.text = title;
            }
        }
        return iconCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        headerView.taskName.text = headerTitleString
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let icon = iconsList[indexPath.row]
        
        if let selectedTask = selectedTask {
            TaskManager.sharedInstance.tasks[selectedTask]["icon"] = icon["icon"]
            let _ = navigationController?.popViewController(animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = collectionView.frame.size.width / 3.5
        return CGSize(width: maxWidth, height: maxWidth)
    }
}
