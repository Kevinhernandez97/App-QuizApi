//
//  ContentView.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import SwiftUI

struct ContentView: View {
@StateObject var viewModel = ViewModel()
@State private var selectedOption = ""

var body: some View {
    NavigationView {
        VStack {
            if viewModel.questions.isEmpty {
                Text("Loading questions...")
                    .font(.title)
                    .padding()
                    .onAppear {
                        viewModel.fetch()
                    }
            } else {
                VStack {
                    Text(viewModel.questions[0].statement)
                        .font(.title)
                    
                    ForEach(viewModel.questions[0].options, id: \.self) { option in
                        Button {
                            selectedOption = option
                        } label: {
                            Text(option)
                        }
                    }
                    }
                }
            }
        .navigationTitle("Quiz App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
