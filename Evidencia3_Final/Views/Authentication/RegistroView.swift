//
//  RegistroView.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import SwiftUI

struct RegistroView: View {
    @Binding var usuarios: [Usuario]
    @State private var correo = ""
    @State private var contrasena = ""
    @State private var nombre = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Registrar nuevo usuario")
                .font(.title)
                .bold()

            TextField("Nombre", text: $nombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Correo", text: $correo)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Contraseña", text: $contrasena)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Guardar usuario") {
                guard !correo.isEmpty, !contrasena.isEmpty, !nombre.isEmpty else {
                    return
                }

                if !usuarios.contains(where: { $0.correo.lowercased() == correo.lowercased() }) {
                    let nuevoUsuario = Usuario(correo: correo, contrasena: contrasena, nombre: nombre)
                    usuarios.append(nuevoUsuario)
                }

                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
        }
        .padding()
    }
}
