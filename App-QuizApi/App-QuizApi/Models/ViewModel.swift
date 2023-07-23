//
//  ViewModel.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var result: [Result] = []
    
    func fetch() {
        guard let url = URL(string: "https://quiz-api-bwi5hjqyaq-uc.a.run.app/question") else { return }
    
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dataDecodingStrategy = .deferredToData
                let questions = try decoder.decode(Question.self, from: data)
                
                DispatchQueue.main.async {
                    self.questions = [questions]
                }
            } catch {
                print("DEBUG: Error decoding question with error: \(error.localizedDescription)")
            }
            
        }
        task.resume()
    }
        
    func submitAnswer(answer: String, for question: Question) {
        guard let url = URL(string: "https://quiz-api-bwi5hjqyaq-uc.a.run.app/answer?questionId=\(question.id)") else { return }
        
        guard let postData = try? JSONEncoder().encode(["answer": answer]) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data else {
                return
            }
            
            if let index = self.questions.firstIndex(where: { $0.id == question.id}) {
                self.questions[index].answered = true
            }
            
            do {
                let result = try JSONDecoder().decode(Result.self, from: data)
                DispatchQueue.main.async {
                    self.result = [result]
                }
                print("Answer result: \(result.result)")
            } catch {
                print("DEBUG: Error decoding answer result with error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
