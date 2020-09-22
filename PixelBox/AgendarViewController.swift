//
//  AgendarViewController.swift
//  PixelBox
//
//  Created by Vicente Patricio on 07/09/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class AgendarViewController: UIViewController, UICollectionViewDelegate {
    
    private func retornaData() -> DateComponents {
        let teste = Date()
        let dataAtual = Calendar.current.dateComponents([.day, .year, .month], from: teste)
        return dataAtual
    }
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBAction func menosData(_ sender: Any) {
        guard let mesSelecionado = labelData.text else { return }
        var numero: Int = 0
        for i in meses {
            if mesSelecionado == i.value {
                
                if i.key < 2 {
                    return
                }else{
                    numero = i.key
                }
            }
        }
        let mesAnterior = numero - 1
        labelData.text = meses[mesAnterior]
    }
    
    @IBAction func maisData(_ sender: Any) {
        guard let mesSelecionado = labelData.text else { return }
        var numero: Int = 0
        for i in meses {
            if mesSelecionado == i.value {
                numero = i.key
                if i.key > 11 {
                    return
                }else{
                    numero = i.key
                }
            }
        }
        let mesPosterior = numero + 1
        labelData.text = meses[mesPosterior]
    }
    
    let meses: [Int: String] = [1: "Janeiro", 2:"Fevereiro", 3: "Março", 4: "Abril", 5: "Maio", 6: "Junho", 7: "Julho", 8: "Agosto", 9: "Setembro", 10: "Outubro", 11: "Novembro", 12: "Dezembro"]
    
    @IBOutlet weak var calendarioCollection: UICollectionView!
    
    private func configDatas(_ listaDatas: [Int: String]){
        
        let mesMesmo = retornaData()
        
        for i in listaDatas {
            if i.key == mesMesmo.month {
                labelData.text = i.value
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarioCollection.dataSource = self
        calendarioCollection.delegate = self
        horariosCollection.dataSource = self
        agendarView.roundCorners([.bottomLeft, .bottomRight], radius: 30)
        configDatas(meses)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var agendarView: UIView!
    
    @IBOutlet weak var horariosCollection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let celulaSelecionada = indexPath.row
        print(celulaSelecionada)
        
        let celula = collectionView.cellForItem(at: indexPath) as! CalendarioCollectionViewCell
        
        
        if celula.backgroundColor == UIColor.clear {
            celula.backgroundColor = .systemBlue
            celula.layer.cornerRadius = 28
            celula.diaLabel.textColor = .white
            celula.feiraLabel.textColor = .white
            
        }else{
            celula.backgroundColor = .clear
            celula.diaLabel.textColor = .black
            celula.feiraLabel.textColor = .black
        }
    }
}

extension AgendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.calendarioCollection {
            return 8
        }else{
            return 9
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.calendarioCollection {
            let calendario = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarioCollectionViewCell", for: indexPath) as! CalendarioCollectionViewCell
            
            return calendario
        }else{
            let horario = collectionView.dequeueReusableCell(withReuseIdentifier: "HorarioCollectionViewCell", for: indexPath) as! HorarioCollectionViewCell
            horario.layer.borderWidth = 1
            horario.layer.borderColor = UIColor.systemBlue.cgColor
            horario.layer.cornerRadius = 8
            
            
            return horario
        }
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
