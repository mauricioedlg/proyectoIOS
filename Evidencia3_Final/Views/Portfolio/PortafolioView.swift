//
//  PortafolioView.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import SwiftUI

struct PortafolioView: View {
    let acciones: [Accion] = [
        Accion(nombre: "Microsoft", porcentaje: 20, color: .blue),
        Accion(nombre: "Google", porcentaje: 15, color: .red),
        Accion(nombre: "Facebook", porcentaje: 10, color: .purple),
        Accion(nombre: "Coca Cola", porcentaje: 25, color: .green),
        Accion(nombre: "McDonalds", porcentaje: 10, color: .orange),
        Accion(nombre: "Apple", porcentaje: 20, color: .pink)
    ]
    let rendimiento: Double = 5.4
    let montoTotal: Double = 10000

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Portafolio de Acciones")
                    .font(.title)
                    .bold()

                PieChartView(acciones: acciones)
                    .frame(width: 300, height: 300)

                HStack {
                    Image(systemName: rendimiento >= 0 ? "arrow.up" : "arrow.down")
                        .foregroundColor(rendimiento >= 0 ? .green : .red)

                    Text(String(format: "%.2f%%", rendimiento))
                        .font(.title2)
                        .foregroundColor(rendimiento >= 0 ? .green : .red)

                    Text("de rendimiento")
                        .foregroundColor(.gray)
                }

                Text("Total invertido: $\(String(format: "%.2f", montoTotal))")
                    .font(.headline)
            }
            .padding()
        }
    }
}
