//
//  InvertirView.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import SwiftUI

struct InvertirView: View {
    @State private var searchText = ""
    let mercadoAcciones: [AccionMercado] = [
        AccionMercado(nombre: "Tesla", precio: 250.30, cambio: 3.2),
        AccionMercado(nombre: "Amazon", precio: 135.80, cambio: -1.5),
        AccionMercado(nombre: "Netflix", precio: 420.10, cambio: 0.8),
        AccionMercado(nombre: "Apple", precio: 180.40, cambio: -0.6),
        AccionMercado(nombre: "Microsoft", precio: 310.25, cambio: 2.1)
    ]

    var filteredAcciones: [AccionMercado] {
        if searchText.isEmpty {
            return mercadoAcciones
        } else {
            return mercadoAcciones.filter {
                $0.nombre.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        VStack {
            TextField("Buscar acción...", text: $searchText)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding()

            List(filteredAcciones) { accion in
                HStack {
                    VStack(alignment: .leading) {
                        Text(accion.nombre)
                            .font(.headline)

                        Text(String(format: "$%.2f", accion.precio))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    HStack {
                        Image(systemName: accion.cambio >= 0 ? "arrow.up" : "arrow.down")
                            .foregroundColor(accion.cambio >= 0 ? .green : .red)

                        Text(String(format: "%.2f%%", accion.cambio))
                            .foregroundColor(accion.cambio >= 0 ? .green : .red)
                            .font(.subheadline)
                    }
                }
            }
        }
        .navigationTitle("Invertir")
    }
}
