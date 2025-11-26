//
//  TransaccionesView.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import SwiftUI

struct TransaccionesView: View {
    @State private var transacciones: [Transaccion] = [
        Transaccion(descripcion: "Compra Apple x10", fecha: Date().addingTimeInterval(-3600 * 24 * 2)),
        Transaccion(descripcion: "Venta Tesla x5", fecha: Date().addingTimeInterval(-3600 * 24 * 5)),
        Transaccion(descripcion: "Compra Microsoft x8", fecha: Date().addingTimeInterval(-3600 * 24 * 10))
    ]

    var body: some View {
        List(transacciones) { t in
            VStack(alignment: .leading, spacing: 4) {
                Text(t.descripcion)
                    .font(.headline)

                Text(formatearFecha(t.fecha))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Transacciones")
    }

    private func formatearFecha(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
