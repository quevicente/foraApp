//
//  DashboardViewController.swift
//  PixelBox
//
//  Created by Vicente Patricio on 06/07/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var barraPesquisar: UISearchBar!
    @IBOutlet weak var emAltaCards: UICollectionView!
    @IBOutlet weak var avaliadosCards: UICollectionView!
    let servicos: [String] = ["Hidraulica", "Marcenaria", "Gesso", "Pintura", "Serralheria", "Elétrica"]
    let nomes: [String] = ["Vicente Patricio", "André Toti", "Henrique Sousa", "Paulo Fernandes"]
    
    @IBOutlet weak var avatarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        emAltaCards.dataSource = self
        avaliadosCards.dataSource = self
        estiloPesquisar()
        avatarView.roundCorners([.bottomLeft, .bottomRight], radius: 30)
        
    }
    
    private func estiloPesquisar(){
        let searchField = self.barraPesquisar.value(forKey: "searchField") as? UITextField
        
        barraPesquisar.frame.size.height = 100
        
        if let field = searchField {
            
            field.backgroundColor = .white
            field.layer.cornerRadius = 10
            field.textColor = .black
            field.tintColor = .white
            field.layer.masksToBounds = true
            
        }
    }
}

extension UIView {
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.emAltaCards {
            return self.servicos.count
        }else{
            return self.nomes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.emAltaCards {
            let celulaCard = collectionView.dequeueReusableCell(withReuseIdentifier: "AltaCollectionViewCell", for: indexPath) as! AltaCollectionViewCell
            
            celulaCard.labelCard.text = self.servicos[indexPath.row]
            return celulaCard
            
        }else {
            let celulaCard = collectionView.dequeueReusableCell(withReuseIdentifier: "AvaliadosCollectionViewCell", for: indexPath) as! AvaliadosCollectionViewCell
            
            celulaCard.avaliadosLabel.text = self.nomes[indexPath.row]
            celulaCard.servicosLabel.text = self.servicos[indexPath.row]
            return celulaCard
        }
        
        
    }
}
