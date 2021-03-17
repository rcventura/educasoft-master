//
//  AgendaDetalheVC.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 02/12/20.
//

import UIKit


class AgendaDetalheVC: UIViewController {
    
    @IBOutlet weak var tbvAgendaDetail: UITableView!
    
    //var arrayLancamentos:[AgendaElement] = []
    
    var idSelecionado: String?
    
    private var agendaElement: [AgendaElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        self.tbvAgendaDetail.register(UINib(nibName: "AgendaDetalheTBVC", bundle: nil), forCellReuseIdentifier: "AgendaDetalheTBVC")
        
        
        //self.agendaElement = self.registroAgendaDetail() ?? []
        
        
        self.tbvAgendaDetail.estimatedRowHeight = 500
        self.tbvAgendaDetail.rowHeight = UITableView.automaticDimension
        
        self.tbvAgendaDetail.delegate = self
        self.tbvAgendaDetail.dataSource = self
    }
    
    
    
//private func registroAgendaDetail() -> [AgendaElement]? {
//
//        if let path = Bundle.main.path(forResource: "agenda", ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//
//                let agenda = try JSONDecoder().decode(Agenda.self, from: data)
//                print("*****\(agenda)")
//                let lista = agenda.agendas?.filter({$0.codagenda == self.idSelecionado ?? "" })
//                return lista
//            } catch {
//                print("deu ruim")
//                return nil
//            }
//        }
//            return nil
//    }
//
}

extension AgendaDetalheVC: UITableViewDelegate {
    
}

extension AgendaDetalheVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.idSelecionado?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell: AgendaDetalheTBVC? = tableView.dequeueReusableCell(withIdentifier: "AgendaDetalheTBVC", for: indexPath) as? AgendaDetalheTBVC

        //let detailmsg = self.agendaElement[indexPath.row]
        //cell?.setupdetalhe(value: self.agendaElement[indexPath.row])
        //cell?.lbDatailDisciplina.text = detailmsg.iddisciplina
        
        return cell ?? UITableViewCell()
    }
    
    
}

