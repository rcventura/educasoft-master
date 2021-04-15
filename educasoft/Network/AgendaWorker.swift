//
//  AgendaWorker.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 15/03/21.
//

import Foundation


class AgendaWorker {
    
    private var dataTask: URLSessionTask?
    
    func getAgenda(completion: @escaping (Result<Agenda, Error>) -> Void ){
        let agendaUrl = "http://127.0.0.1:3000/agenda"
        
        guard let url = URL(string: agendaUrl) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { (data,response, error) in
            
            if let error = error {
                completion(.failure(error))
                print("Deu erro: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Response Vazio")
                return
            }
            print("Response statusCode: \(response.statusCode)")
            guard let data = data else {
                print("Vazio Data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Agenda.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(jsonData))
                    print(jsonData)
                }
            }catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
