//
//  HorariosVC.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 18/11/20.
//

import UIKit

class HorariosVC: UIViewController {

    @IBOutlet weak var navBarTitle: UINavigationItem!
    
    @IBOutlet weak var tbvHorario: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func bntVoltarAC(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

    
    

