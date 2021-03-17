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

        
        
        // Do any additional setup after loading the view.
        
//        self.tbvHorario.register(UINib(nibName: "HorariosTBVC", bundle: nil), forCellReuseIdentifier: "HorariosTBVC")
        
//        self.tbvHorario.delegate = self
//        self.tbvHorario.dataSource = self
    }
    

    @IBAction func bntVoltarAC(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
//extension HorariosVC: UITableViewDelegate {
//    
//
//}

//extension HorariosVC: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//        let cellH: HorariosTBVC? = tableView.dequeueReusableCell(withIdentifier: "HorariosTBVC", for: indexPath) as? HorariosTBVC
//        return cellH ?? UITableViewCell()
//
//    }
//
    
    

