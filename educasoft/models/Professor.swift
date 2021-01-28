//
//  Professor.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 19/11/20.
//

import Foundation

struct Professor: Codable {
    let idprofessor: Int?
    let codprofessor: Int?
    let idpessoa: Pessoa?
    let idturma: Turma?
    let iddisciplina: Disciplinas?

}
