//
//  Turma.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 19/11/20.
//

import Foundation

struct Turma: Codable {
    let idturma: Int?
    let coddisciplina: Disciplinas?
    let codhorario: Horario?
    let raaluno: Aluno?
}
