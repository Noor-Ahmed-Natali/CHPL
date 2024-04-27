//
//  ContentView.swift
//  chpl
//
//  Created by Noor Ahmed on 27/04/24.
//

import SwiftUI
import SwiftUIPager

struct MainView: View {
    @State var data: [DataModel] = []
    @State private var currentIndex = 0
    @State private var moveToFinal: Bool = false
    
    var isLast: Bool {
        currentIndex == (data.count-1)
    }
    
    var body: some View {
        VStack {
            questionIndicator
            Spacer()
            Pager(page: .withIndex(currentIndex), data: 0..<data.count, id: \.self) { index in
                VStack {
                    QuestionView(questionData: $data[index].wrappedValue.question, selected: $data[index].selectedAns)
                    if isLast {
                        button
                    }
                }
                .padding(24)
            }
            .onPageChanged({ index in
                self.currentIndex = index
            })
        }
        .task {
            await fetchQuestions()
        }
        .navigationDestination(isPresented: $moveToFinal, destination: { ResultView(data: data) } )
    }
    
    var questionIndicator: some View {
        Text("Question \(currentIndex+1) of \(data.count)")
            .foregroundStyle(.red)
            .font(.system(size: 20))
            .bold()
    }
    
    var button: some View {
        Button(action: {
            self.moveToFinal = true
        }, label: {
            Text("Submit")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .foregroundColor(.white)
        })
        .background(Color.red)
    }
}

extension MainView {
    
    func fetchQuestions() async {
        let url = "https://dev.my-company.app/demo.json"
        let result = await NetworkManager.shared.baseRequest(url: url, model: [QuestionModel].self)
        switch result {
        case .success(let success):
            self.data = Array((success?.shuffled().prefix(10).map{ $0.convertToDataModel()}) ?? [])
        case .failure(let failure):
            print(failure)
        }
    }
}

struct DataModel: Identifiable  {
    var question: QuestionModel
    var selectedAns: String?
    
    var id: String? {
        question.id
    }
}


//#Preview {
//    MainView()
//}
