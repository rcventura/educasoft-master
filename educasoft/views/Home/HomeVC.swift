//
//  HomeVC.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 06/11/20
//

import UIKit

class HomeVC: UIViewController {

  // IDENTIFICADOR PARA DESCRICAO E IMAGENS
    enum TipoMenu: Int {
        case Agenda = 1
        case Horarios = 2
        case Boletim = 3
        case Faltas = 4
        case Ocorrencias = 5
        case Comunicado = 6
    }
    
    
  
    @IBOutlet weak var imgAluno: UIImageView!
    @IBOutlet weak var titleHome: UINavigationItem!
    @IBOutlet weak var iconsCV: UICollectionView!
    
    
    // ARRAY DE CONTRUCAO DAS OPCOES DO HOME
    var arrayIcons: [Menu] = [Menu(id: 1, descricao: "Agenda", iconImage: "agenda"),
                              Menu(id: 2, descricao: "Horarios", iconImage: "horarios"),
                              Menu(id: 3, descricao: "Boletim", iconImage: "boletim"),
                              Menu(id: 4, descricao: "Faltas", iconImage: "faltas"),
                              Menu(id: 5, descricao: "Ocorrências", iconImage: "ocorrencia"),
                              Menu(id: 6, descricao: "Comunicado", iconImage: "comunicado"),]
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAlunos()
        self.iconsCV.register(UINib(nibName: "HomeCVCell", bundle: nil), forCellWithReuseIdentifier: "HomeCVCell")
        self.titleHome.title = "Centro Educacional Geração"
        self.iconsCV.delegate = self
        self.iconsCV.dataSource = self
    }

    // CONEXAO COM API ( LOCAL )
    func getAlunos() {
        let session: URLSession = URLSession.shared
        let url: URL? = URL(string: "http://127.0.0.1:3000/alunos")
        if let _url = url {
            let task: URLSessionTask = session.dataTask(with: _url) { (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data ?? Data(), options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }
            task.resume()
        }
    }
    
    
    
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: HomeCVCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCVCell", for: indexPath) as? HomeCVCell
        
        cell?.configMenuHome(menu: self.arrayIcons[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(self.arrayIcons[indexPath.row].id)
        
        
        
switch TipoMenu(rawValue: self.arrayIcons[indexPath.row].id ?? 0) {
        case .Agenda:
            self.performSegue(withIdentifier: "AgendaVC", sender: self.arrayIcons[indexPath.row])
        case .Boletim:
            self.performSegue(withIdentifier: "BoletimVC", sender: self.arrayIcons[indexPath.row])
        case .Horarios:
            self.performSegue(withIdentifier: "HorariosVC", sender: self.arrayIcons[indexPath.row])
        case .Faltas:
            self.performSegue(withIdentifier: "FaltasVC", sender: self.arrayIcons[indexPath.row])
        case .Ocorrencias:
            self.performSegue(withIdentifier: "OcorrenciaVC", sender: self.arrayIcons[indexPath.row])
        case .Comunicado:
            self.performSegue(withIdentifier: "ComunicadoVC", sender: self.arrayIcons[indexPath.row])
        case .none:
            print("nada")
        }
        


       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menu: Menu? = sender as? Menu
        let agenda = segue.destination as? AgendaVC
        let boletim = segue.description as? BoletimVC
        let horario = segue.description as? HorariosVC
        let faltas = segue.description as? FaltasVC
        let ocorrencias = segue.description as? OcorrenciaVC
        let comunicado = segue.description as? ComunicadoVC
        
        
  }
}
