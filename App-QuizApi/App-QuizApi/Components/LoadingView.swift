//
//  LoadingView.swift
//  App-QuizApi
//
//  Created by Kevin Hernandez on 23/07/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading questions")
            .font(.title)
            .fontWeight(.bold)
        HStack(spacing: 10) {
            
            Text(".")
                .animation(Animation.linear(duration: 0.5).repeatForever())
            
           
            Text(".")
                .animation(Animation.linear(duration: 0.5).repeatForever().delay(0.2))
        
 
            Text(".")
                .animation(Animation.linear(duration: 0.5).repeatForever().delay(0.4))
            
        }
        .font(.title)
        .padding(.top, 5)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
