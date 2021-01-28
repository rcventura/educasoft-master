//
//  Matricula.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 17/11/20.
//

import Foundation

struct Matricula: Codable {
    let idmatricula: Int?
    let idturma: Turma?
    let dtmatricula: String?
    let idsituacao: Situacao?
    let idtipoensino: Tipoensino?

}
