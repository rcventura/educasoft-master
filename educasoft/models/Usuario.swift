//
//  Usuario.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 19/11/20.
//

import Foundation

struct Usuario: Codable {
    let idusuario: Int?
    let usuario: String?
    let senha: String?
    let status: String?
    let idpessoa: Pessoa?
}
