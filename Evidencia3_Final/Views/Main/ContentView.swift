//
//  ContentView.swift
//  Evidencia3_Final
//
//  Created by Alumno on 25/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedScreen: String? = "Inicio"
    @State private var mostrarLogin = false

    var body: some View {
        NavigationView {
            List(selection: $selectedScreen) {
                NavigationLink(destination: InicioView(), tag: "Inicio", selection: $selectedScreen) {
                    Label("Inicio", systemImage: "house.fill")
                }

                NavigationLink(destination: PortafolioView(), tag: "Portafolio", selection: $selectedScreen) {
                    Label("Portafolio", systemImage: "briefcase.fill")
                }

                NavigationLink(destination: InvertirView(), tag: "Invertir", selection: $selectedScreen) {
                    Label("Invertir", systemImage: "chart.bar.fill")
                }

                NavigationLink(destination: TransaccionesView(), tag: "Transacciones", selection: $selectedScreen) {
                    Label("Transacciones", systemImage: "arrow.2.squarepath")
                }

                NavigationLink(destination: ConfiguracionView(), tag: "Configuración", selection: $selectedScreen) {
                    Label("Configuración", systemImage: "gear")
                }

                Section {
                    Button(action: {
                        UserDefaults.standard.removeObject(forKey: "nombreUsuario")
                        mostrarLogin = true
                    }) {
                        Label("Cerrar Sesión", systemImage: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Menú")
            .navigationBarBackButtonHidden(true)

            InicioView()
        }
        .fullScreenCover(isPresented: $mostrarLogin) {
            LoginView()
        }
    }
}
