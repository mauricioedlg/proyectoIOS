//
//  Untitled.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import Foundation

struct Transaccion: Identifiable {
    let id = UUID()
    let descripcion: String
    let fecha: Date
}
