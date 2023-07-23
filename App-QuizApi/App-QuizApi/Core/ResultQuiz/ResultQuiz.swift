//
//  ResultQuiz.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import SwiftUI

struct ResultQuiz: View {
    @Binding var isShowerFinish: Bool
    @Binding var answersResponse: Int
    @Binding var questionCounter: Int
    @StateObject private var appState = AppState()
    @StateObject var viewModel = ViewModel()
    @State private var animateScore = false

    var body: some View {
        VStack {
            VStack {
                Text("Score")
                    .fontWeight(.semibold)
                Text("\(answersResponse) / 10")
                    .font(.title)
                    .padding()
            }
            .frame(width: 150, height: 150)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(.white)
            .cornerRadius(50)
            .scaleEffect(animateScore ? 1.2 : 1.0)

            // ... (Other content for the result sheet)

            Button {
                // Reset game state and dismiss the sheet
                appState.isShowingUser = false
                isShowerFinish = false
                answersResponse = 0
                questionCounter = 0
                viewModel.fetch()
                
                withAnimation {
                    animateScore.toggle()
                }
            } label: {
                Text("Recomeçar Quiz")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: 250)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(15)
            }
            .padding()
        }
    }
}

struct ResultQuiz_Previews: PreviewProvider {
    static var previews: some View {
        ResultQuiz(isShowerFinish: .constant(false), answersResponse: .constant(0), questionCounter: .constant(0))
    }
}
