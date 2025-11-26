//
//  AccionMercado.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import Foundation

struct AccionMercado: Identifiable {
    let id = UUID()
    let nombre: String
    let precio: Double
    let cambio: Double
}
