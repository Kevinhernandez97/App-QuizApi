//
//  ContentView.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import SwiftUI

struct ContentView: View {
@State private var userName = ""
@ObservedObject var appState = AppState()
    
var body: some View {
    NavigationView {
        if appState.isShowingUser {
            LoadingQuestion()
            } else {
                VStack {
                    Text("Bem-vindo ao Quiz App!")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 20)
                        
                    Text("O Quiz consiste em uma sequência de 10 perguntas de múltipla escolha.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 40)
                    
                    Spacer()
                    
                    Image(systemName: "book.circle.fill")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 100, height: 100)
                       .foregroundColor(.green)
                       .overlay(
                          Image(systemName: "pencil")
                              .font(.system(size: 60))
                              .offset(x: 35, y: -27)
                            .foregroundColor(.gray)
                       )
                    
                    Spacer()
                    
                    
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
                    Spacer()
                }
                .padding(.horizontal)
//                .navigationTitle("Quiz App")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
