//
//  ProjetarViewController.swift
//  PixelBox
//
//  Created by Vicente Patricio on 31/08/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class ProjetarViewController: UIViewController {
    
    let cards: [String] = ["Arquitetos", "Designers", "Engenheiros", "Paisagistas", "Projeto 3D", "Visagismo"]
    
    @IBOutlet weak var colecaoProjetos: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoProjetos.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ProjetarViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celulaCard = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjetarCollectionViewCell", for: indexPath) as! ProjetarCollectionViewCell
        
        celulaCard.labelProjetar.text = self.cards[indexPath.row]
        
        return celulaCard
    }
    
    
}
