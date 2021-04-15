//
//  AgendaController.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 10/03/21.
//

import Foundation

class AgendaController {
    
    private var agendaList = AgendaWorker()
    private var arrayAgenda = Agenda()
    
    func getAgenda(completion: @escaping() -> ()) {
        agendaList.getAgenda { [weak self](result) in
            switch result {
            case .success(let listOf):
                self?.arrayAgenda = listOf
                completion()
            print("Deu certoooooooooo")
                print(self?.arrayAgenda)
                
            case .failure(let error):
                print("Erro ao processar json \(error)")
            }
            
        }
    }

    
    func numberOfRowInSection(section: Int) -> Int {
        if self.arrayAgenda.count != 0 {
            return self.arrayAgenda.count
        }
        return 0
    }
    
    
    func cellForRowAt(indexpath: IndexPath) -> AgendaElement {
        return arrayAgenda[indexpath.row]
    }
}
