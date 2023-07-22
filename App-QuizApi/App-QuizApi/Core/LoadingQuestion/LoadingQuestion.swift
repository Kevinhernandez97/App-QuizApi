//
//  LoadingQuestion.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import SwiftUI

struct LoadingQuestion: View {
    @StateObject var viewModel = ViewModel()
    @State private var selectedOption = ""
    
    var body: some View {
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
                            viewModel.submitAnswer(answer: option, for: viewModel.questions[0])
                        } label: {
                            VStack {
                                HStack {
                                    Text(option)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                                
                               
                            }
                            .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
                        }
                    }
                    
                        if viewModel.result.isEmpty {
                            Text("")
                        } else {
                            Text("\(viewModel.result[0].result ?        "Correcto" : "Incorrecto")")
                        }
                    }
                .padding(.horizontal)
                }
            }
    }
}

struct LoadingQuestion_Previews: PreviewProvider {
    static var previews: some View {
        LoadingQuestion()
    }
}
