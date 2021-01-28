//
//  HomeCVCell.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 06/11/20.
//

import UIKit

class HomeCVCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageHome: UIImageView!
    @IBOutlet weak var lbDescricao: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    func configMenuHome(menu: Menu) {
        self.lbDescricao.text = menu.descricao
        self.iconImageHome.image = UIImage(named: menu.iconImage ?? "")
    }
}
