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
    
    var arrayLancamentos:[AgendaElement] = []
    
    //private var agenda: Agenda?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arrayLancamentos = self.registroAgenda() ?? []

        self.tbvAgenda.register(UINib(nibName: "AgendaTBVC", bundle: nil), forCellReuseIdentifier: "AgendaTBVC")

        self.tbvAgenda.delegate = self
        self.tbvAgenda.dataSource = self
        
        self.calendarioAgenda.layer.cornerRadius = 10
        self.calendarioAgenda.backgroundColor = UIColor.white
        
    }
    
    private func registroAgenda() -> [AgendaElement]? {
        
        if let path = Bundle.main.path(forResource: "agenda", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let agenda = try JSONDecoder().decode(Agenda.self, from: data)
                print("*****\(agenda)")
                return agenda.agendas
            } catch {
                print("deu ruim")
                return nil
            }
        }
            return nil
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func bntVoltarAC(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension AgendaVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.agendaSelecionada(id: self.arrayLancamentos[indexPath.row].idprofessor ?? "", disciplina: self.arrayLancamentos[indexPath.row].iddisciplina ?? "")

        //self.performSegue(withIdentifier: "AgendaDetalheVC", sender: self.arrayLancamentos[indexPath.row])
        
        //print(self.arrayLancamentos[indexPath.row])

    }
}


extension AgendaVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayLancamentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: AgendaTBVC? = tableView.dequeueReusableCell(withIdentifier: "AgendaTBVC", for: indexPath) as? AgendaTBVC

        cell?.setup(value: self.arrayLancamentos[indexPath.row], delegate: self)
        
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
