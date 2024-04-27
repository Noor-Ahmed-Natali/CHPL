//
//  ResultView.swift
//  chpl
//
//  Created by Noor Ahmed on 27/04/24.
//

import SwiftUI

struct ResultView: View {
    var data: [DataModel]
    
    var correctCount: Int {
        self.data.filter({$0.selectedAns == $0.question.correct }).count
    }
    
    var skipCount: Int {
        self.data.filter({$0.selectedAns == nil }).count
    }
    
    var wrongCount: Int {
        data.count - (skipCount+correctCount)
    }
    
    var body: some View {
        VStack {
            Text("Well Done")
                .font(.system(size: 24))
                .foregroundStyle(.red)
            
            VStack {
                Text("Right Answer: \(correctCount)")
                
                Text("Wrong Answer: \(wrongCount)")
                
                Text("Skip Answer: \(skipCount)")
            }
        }
    }
}

//#Preview {
//    ResultView()
//}
