//
//  ViewModel.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 22/07/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var questions: [Question] = []
    
    func fetch() {
        guard let url = URL(string: "https://quiz-api-bwi5hjqyaq-uc.a.run.app/question") else { return }
    
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dataDecodingStrategy = .deferredToData
                let questions = try decoder.decode(Question.self, from: data)
                DispatchQueue.main.async {
                    self?.questions = [questions]
                }
            } catch {
                print("DEBUG: Error decoding question with error: \(error.localizedDescription)")
            }
            
        }
        task.resume()
    }
}
