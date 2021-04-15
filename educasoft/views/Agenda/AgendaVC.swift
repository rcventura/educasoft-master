//
//  AgendaVC.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 06/11/20.
//

import UIKit

class AgendaVC: UIViewController {
    

    @IBOutlet weak var calendarioAgenda: UIDatePicker!
    @IBOutlet weak var tbvAgenda: UITableView!
    @IBOutlet weak var bntVoltar: UIBarButtonItem!
        
    //private var agenda: Agenda?
    private var controller: AgendaController = AgendaController()
    //private var controllerWorker: AgendaWorker = AgendaWorker()
    
    private func configDatePicker() {
        self.calendarioAgenda.layer.cornerRadius = 10
        self.calendarioAgenda.backgroundColor = UIColor.white
    }
    
    // CONFIGUACAO DA TABLEVIEW
    private func configTableView() {
        self.tbvAgenda.register(UINib(nibName: "AgendaTBVC", bundle: nil), forCellReuseIdentifier: "AgendaTBVC")
        self.tbvAgenda.delegate = self
        self.tbvAgenda.dataSource = self
        self.tbvAgenda.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configDatePicker()
        self.configTableView()
    }
    
    @IBAction func bntVoltarAC(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension AgendaVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "AgendaDetalheVC", sender: nil)
    }
}


extension AgendaVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return self.controller.numberOfRowInSection(section: section)
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: AgendaTBVC? = tableView.dequeueReusableCell(withIdentifier: "AgendaTBVC", for: indexPath) as? AgendaTBVC
        cell?.setupAgenda(delegate: self)
        return cell ?? UITableViewCell()
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc:AgendaDetalheVC? = segue.destination as? AgendaDetalheVC
        vc?.idSelecionado = sender as? String
        
    }
    
}

extension AgendaVC: AgendaTBVCDelegate {
    func agendaSelecionada(id: String, disciplina: String) {
        self.performSegue(withIdentifier: "AgendaDetalheVC", sender: id )
        print("ID Selecionado: \(id)")
    }
    
}
