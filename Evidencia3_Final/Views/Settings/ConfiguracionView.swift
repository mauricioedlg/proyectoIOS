//
//  Untitled.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import SwiftUI

struct ConfiguracionView: View {
    @State private var notificaciones = true
    @State private var temaOscuro = false

    var body: some View {
        Form {
            Toggle("Notificaciones", isOn: $notificaciones)
            Toggle("Tema oscuro", isOn: $temaOscuro)

            Section(header: Text("Cuenta")) {
                Button(role: .destructive) {
                    UserDefaults.standard.removeObject(forKey: "nombreUsuario")
                } label: {
                    Text("Cerrar sesión (limpiar nombre)")
                }
            }
        }
        .navigationTitle("Configuración")
    }
}
