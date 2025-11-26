//
//  LoginView.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import SwiftUI

struct LoginView: View {
    @State private var correo = ""
    @State private var contrasena = ""
    @State private var mostrarPrincipal = false
    @State private var mensajeError = ""
    @State private var usuarios: [Usuario] = [
        Usuario(correo: "al02976904@tecmilenio.mx", contrasena: "Tecmilenio#06", nombre: "Mauricio Estrada De la Garza"),
        Usuario(correo: "al03091719@tecmilenio.mx", contrasena: "1234567890", nombre: "Brayan Eleazar Villegas Navarro"),
        Usuario(correo: "al02665142@tecmilenio.mx", contrasena: "0987654321", nombre: "Hugo Adrian Casas Elizondo")
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Inicio de Sesión")
                    .font(.largeTitle)
                    .bold()

                TextField("Correo", text: $correo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Contraseña", text: $contrasena)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Iniciar Sesión") {
                    if let usuario = usuarios.first(where: { $0.correo == correo && $0.contrasena == contrasena }) {
                        UserDefaults.standard.set(usuario.nombre, forKey: "nombreUsuario")
                        mostrarPrincipal = true
                        mensajeError = ""
                    } else {
                        mensajeError = "Correo o contraseña incorrectos"
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)

                if !mensajeError.isEmpty {
                    Text(mensajeError)
                        .foregroundColor(.red)
                        .bold()
                }

                NavigationLink(destination: RegistroView(usuarios: $usuarios)) {
                    Text("Registrar usuario")
                        .foregroundColor(.blue)
                        .underline()
                }
            }
            .padding()
        }
        .fullScreenCover(isPresented: $mostrarPrincipal) {
            ContentView()
        }
    }
}
