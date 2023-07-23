//
//  ContentView.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import SwiftUI

struct ContentView: View {
@State private var userName = ""
//@State private var isShowingUser = false
    @ObservedObject var appState = AppState()
    
var body: some View {
    NavigationView {
        if appState.isShowingUser {
            LoadingQuestion()
            } else {
                VStack {
                    TextField("Inserir Nome", text: $userName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    Button {
                        appState.isShowingUser = true
                    } label: {
                        VStack {
                            Text("INGRESAR")
                        }
                        .frame(width: 200, height: 40)
                        .background(Color(.systemBlue))
                        .opacity(userName.isEmpty ? 0.5 : 1.0)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .disabled(userName.isEmpty)
                }
                .padding(.horizontal)
                .navigationTitle("Quiz App")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
