//
//  InicioView.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import SwiftUI

struct InicioView: View {
    var nombreUsuario: String {
        UserDefaults.standard.string(forKey: "nombreUsuario") ?? "Usuario"
    }

    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()

            Text("BIENVENIDO \(nombreUsuario.uppercased())!")
                .font(.title)
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
