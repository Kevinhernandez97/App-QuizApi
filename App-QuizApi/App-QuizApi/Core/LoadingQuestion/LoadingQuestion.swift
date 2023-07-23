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
    @State private var questionCounter = 0
    @State private var answersResponse = 0
    
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
                            if !viewModel.questions[0].answered {
                                selectedOption = option
                                viewModel.submitAnswer(answer: option, for: viewModel.questions[0])
                            }
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
                        .disabled(viewModel.questions[0].answered)
                    }
                    
                        HStack {
                            if viewModel.result.isEmpty {
                                Text("")
                            } else {
                                Text("\(Text(viewModel.result[0].result, format: "%@"))")
                                    .frame(width: 80, height: 80)
                                    .background(viewModel.result[0].result == true ? .green : .red)
//                                Text("\(answersResponse)")
                            }
                            
                            Spacer()
                            
                            Button {
                                if questionCounter < 9 {
                                    questionCounter += 1
                                    selectedOption = ""
                                    viewModel.result = []
                                    viewModel.fetch()
//                                    if viewModel.result[0].result == true {
//                                        answersResponse += 1
//                                    }
                                }
                            } label: {
                                Image(systemName: "arrow.right")
                            }
                           
                        }
                    }
                .padding(.horizontal)
                }
            }
    }
}

extension Text {
    init(_ value: Bool, format: String) {
        self = Text(String(format: format, value ? "True" : "False"))
    }
}

struct LoadingQuestion_Previews: PreviewProvider {
    static var previews: some View {
        LoadingQuestion()
    }
}
