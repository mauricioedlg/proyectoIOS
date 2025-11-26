//
//  Untitled.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import SwiftUI

struct PieChartView: View {
    let acciones: [Accion]

    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            ZStack {
                ForEach(slices(), id: \.self.index) { slice in
                    ZStack {
                        PieSlice(startAngle: slice.startAngle, endAngle: slice.endAngle)
                            .fill(slice.color)

                        let midAngle = (slice.startAngle.degrees + slice.endAngle.degrees) / 2
                        let radius = size * 0.35
                        let center = CGPoint(x: size / 2, y: size / 2)
                        let x = center.x + radius * cos(CGFloat(midAngle - 90) * .pi / 180)
                        let y = center.y + radius * sin(CGFloat(midAngle - 90) * .pi / 180)

                        Text("\(acciones[slice.index].nombre)\n\(acciones[slice.index].porcentaje, specifier: "%.0f")%")
                            .font(.caption2)
                            .multilineTextAlignment(.center)
                            .padding(4)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .position(x: x, y: y)
                    }
                }

                Circle()
                    .fill(Color.white)
                    .frame(width: size * 0.5, height: size * 0.5)

                VStack {
                    Text("Portafolio")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .frame(width: size, height: size)
        }
    }

    func slices() -> [PieSliceData] {
        var slices: [PieSliceData] = []
        let total = acciones.reduce(0) { $0 + $1.porcentaje }
        var startAngle = Angle(degrees: 0)

        for (index, accion) in acciones.enumerated() {
            let angle = Angle(degrees: (accion.porcentaje / total) * 360)
            let endAngle = startAngle + angle
            slices.append(PieSliceData(index: index, startAngle: startAngle, endAngle: endAngle, color: accion.color))
            startAngle = endAngle
        }

        return slices
    }
}
