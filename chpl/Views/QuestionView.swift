//
//  QuestionView.swift
//  chpl
//
//  Created by Noor Ahmed on 27/04/24.
//

import SwiftUI

struct QuestionView: View {
    var questionData: QuestionModel
    @Binding var selected: String?
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(questionData.question ?? "")
            
            VStack(alignment: .leading, spacing: 8) {
                
                if let option = questionData.ans1,
                   !option.isEmpty {
                    
                    RadioButton(label: option, isSelected: selected == QuestionModel.CodingKeys.ans1.rawValue) {
                        self.selected = QuestionModel.CodingKeys.ans1.rawValue
                    }
                }
                
                if let option = questionData.ans2,
                   !option.isEmpty {
                    
                    RadioButton(label: option, isSelected: selected == QuestionModel.CodingKeys.ans2.rawValue) {
                        self.selected = QuestionModel.CodingKeys.ans2.rawValue
                    }
                }
                
                if let option = questionData.ans3,
                   !option.isEmpty {
                    
                    RadioButton(label: option, isSelected: selected == QuestionModel.CodingKeys.ans3.rawValue) {
                        self.selected = QuestionModel.CodingKeys.ans3.rawValue
                    }
                }
                
                if let option = questionData.ans4,
                   !option.isEmpty {
                    
                    RadioButton(label: option, isSelected: selected == QuestionModel.CodingKeys.ans4.rawValue) {
                        self.selected = QuestionModel.CodingKeys.ans4.rawValue
                    }
                }
                
                if let option = questionData.ans5,
                   !option.isEmpty {
                    
                    RadioButton(label: option, isSelected: selected == QuestionModel.CodingKeys.ans5.rawValue) {
                        self.selected = QuestionModel.CodingKeys.ans5.rawValue
                    }
                }
            }
        }
        .background(Color.white.opacity(0.01))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}


#Preview {
    QuestionView(questionData: .dummy, selected: .constant(nil))
}




//Picker("", selection: $selected) {
//    if let option1 = questionData.ans1, !option1.isEmpty {
//        Text(option1)
//    }
//    
//    if let option2 = questionData.ans2, !option2.isEmpty {
//        Text(option2)
//    }
//    if let option3 = questionData.ans3, !option3.isEmpty {
//        Text(option3)
//    }
//    if let option4 = questionData.ans4, !option4.isEmpty {
//        Text(option4)
//    }
//    if let option5 = questionData.ans5, !option5.isEmpty {
//        Text(option5)
//    }
//}
//.labelsHidden()
