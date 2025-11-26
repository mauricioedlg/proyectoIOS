//
//  Usuario.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import Foundation

struct Usuario: Identifiable {
    let id = UUID()
    let correo: String
    let contrasena: String
    let nombre: String
}
