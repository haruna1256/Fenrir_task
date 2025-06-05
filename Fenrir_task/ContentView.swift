//
//  ContentView.swift
//  Fenrir_task
//
//  Created by 川岸遥奈 on 2025/06/04.
//

import SwiftUI

struct ContentView: View {
    //    入力されたものを受け取る変数
    @State private var inputText: String = ""
    //    判定結果の変数
    @State private var result: Bool = false
    var body: some View {
        VStack {
            Text("括弧閉じてるか判定")
                .font(.title)
                .bold()
            //            入力項目
            TextField("例：(){}[]", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            //            判定処理を促すボタン
            Button("判定する") {
//                result = isValid(inputText)
            }
            .padding()
            .background(Color.red)
            .foregroundStyle(Color.white)
            .cornerRadius(10)
            
//            if let resultText = result {
//                Text(resultText ? "正しい" : "正しくない")
//                    .font(.headline)
//                    
//                
//            }
            Spacer()
            
        }
        .padding()
    }
}


//　かっこが閉じているか判定するメソッド
//func isValid(_ s: String) -> Bool {‬
//    
//    
//    
//    return true
//    ‭ }‬



#Preview {
    ContentView()
}
