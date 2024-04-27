//
//  QuestionModel.swift
//  chpl
//
//  Created by Noor Ahmed on 27/04/24.
//

import Foundation

struct QuestionModel: Codable, Identifiable, Equatable {
    
    var id, question, ans1, ans2: String?
    var ans3, ans4, ans5, correct: String?
    var addedDate, modifiedDate, status: String?
    
    enum CodingKeys: String, CodingKey {
        case id, question, ans1, ans2, ans3, ans4, ans5, correct
        case addedDate = "added_date"
        case modifiedDate = "modified_date"
        case status
    }
    
    func convertToDataModel() -> DataModel {
        return .init(question: self, selectedAns: nil)
    }
}

extension QuestionModel {
    
    static var dummy: Self = .init(id: "101", question: "Urinating less is one of the signs of", ans1: "True", ans2: "False", correct: "ans2")
}

//
//{"id":"101","question":"Urinating less is one of the signs of diabetes.","ans1":"True","ans2":"False","ans3":"","ans4":"","ans5":"","correct":"ans2","added_date":"2017-04-08 18:57:19","modified_date":"0000-00-00 00:00:00","status":"Active"}
