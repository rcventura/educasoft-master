//
//  AgendaDetalheTBVC.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 02/12/20.
//


import UIKit
import CoreData

class AgendaDetalheTBVC: UITableViewCell {

    @IBOutlet weak var lbDetailNomeProfessor: UILabel!
    @IBOutlet weak var lbDatailDisciplina: UILabel!
    @IBOutlet weak var lbDataRegistro: UILabel!
    @IBOutlet weak var textMensagem: UITextView!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var bntConfirmarUI: UIButton!
    
    private var agenda: Agenda?

    
    // PEGA A SITUACAO ATUAL NO COREDATA
    private func getStatusConfirmacao() -> String {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<CoreConfirmacao> = CoreConfirmacao.fetchRequest()
        var confi = ""
        do {
            let confirmacaos = try context.fetch(request)
            confi = confirmacaos.first?.confirmacao ?? ""
            
            if confi != "Confirmado" {
                self.bntConfirmarUI.isEnabled = true
                
            } else {
                self.bntConfirmarUI.isEnabled = false
                self.bntConfirmarUI.backgroundColor = .lightGray
            }
        } catch {
            print("Erro ao trazer o registro! \(error)")
        }
        if confi != "" {
        self.lbStatus.text = confi
        } else {
            self.lbStatus.text = "Aguardando Confirmação"
        }
        return confi
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.getStatusConfirmacao()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // BOTAO QUE DE CONFIRMACAO DA LEITURA E SALVA NO COREDATA
    @IBAction func bntConfirmar(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let confirmacao =  CoreConfirmacao(context: context)
        confirmacao.confirmacao = "Confirmado"
        do {
            try context.save()
            print("OK")
        } catch {
            print("Erro ao confirmar a leitura!! \(error) " )
            print("OKkKKKK")
        }
    
    }
    
    // SETUP DO DETALHE DA AGENDA
    func setupdetalhe() {
        self.lbDetailNomeProfessor.text = "Rodrigo Ventura"
        self.lbDatailDisciplina.text = "Matemática"
        self.lbDataRegistro.text = "14/04/2021"
        self.textMensagem.text = """
            Dever de casa páginas: 35,36 e 37


            Maria Beatriz não fez o dever de casa da página: 27 e 28

            """
    }
    
}
