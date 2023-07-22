//
//  ContentView.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import SwiftUI

struct ContentView: View {
@State private var userName = ""
@State private var isShowingUser = false
    
var body: some View {
    NavigationView {
            if isShowingUser {
                LoadingQuestion()
            } else {
                VStack {
                    TextField("Inserir Nome", text: $userName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    Button {
                        isShowingUser = true
                    } label: {
                        VStack {
                            Text("INGRESAR")
                        }
                        .frame(width: 200, height: 40)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
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
