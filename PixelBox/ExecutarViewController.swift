//
//  ExecutarViewController.swift
//  PixelBox
//
//  Created by Vicente Patricio on 27/08/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class ExecutarViewController: UIViewController {
    let cards: [String] = ["Marcenaria", "Hidraulica", "Gesso", "Pintura", "Serralheria", "Elétrica", "Mecânica",  "Engenharia", "Design de Interiores", "Outros Serviços"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var colecaoView: UICollectionView!
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ExecutarViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celulaCard = collectionView.dequeueReusableCell(withReuseIdentifier: "ExecutarCollectionViewCell", for: indexPath) as! ExecutarCollectionViewCell
        
        celulaCard.labelExecutar.text = self.cards[indexPath.row]
        
        return celulaCard
    }
    
    
}
