//
//  AgendaWorker.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 15/03/21.
//

import Foundation


class AgendaWorker {
    
    typealias completion <T> = (_ result: T, _ failure: NSError) -> Void
    
    func getAgendaByAluno(codagenda: Int, codaluno: Int, completion: @escaping completion<AgendaElement?>){
        
        let session: URLSession = URLSession.shared
        
        let url: URL? = URL(string: "http://127.0.0.1:3000/agenda")
        
        if let _url = url {
            let task: URLSessionTask = session.dataTask(with: _url) { (data, response, error) in
            do {
                let listaAgenda = try JSONDecoder().decode([AgendaElement].self, from: data ?? Data())
                print(listaAgenda.)
            } catch {
                print("ffdfdfjdfjkdfjkdfjdkfjkdfjkdfjdkfjdkfjdkfjdkfjdkfjdkfdkfj")
                print(error)
            }
                
        }
            task.resume()
        }
        
    }
}
