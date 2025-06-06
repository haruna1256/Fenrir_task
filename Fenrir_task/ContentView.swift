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
    @State private var result: Bool = true
    //    正しいかどうか表示する変数
    @State private var resultText: String = " "
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
                //                判定するメソッドに飛ばす
                result = isValid(inputText)
                //            正しいかどうかの表示
                if result == true{
                    resultText = "正しい"
                }else if result == false {
                    resultText = "正しくない"
                }
                print("結果：\(resultText)")
            }
            .padding()
            .background(Color.red)
            .foregroundStyle(Color.white)
            .cornerRadius(10)
            
            
            Text("結果：\(resultText)" )
                .font(.headline)
            
            Spacer()
            
        }
        .padding()
    }
}


//　かっこが閉じているか判定するメソッド
func isValid(_ s: String) -> Bool {
//    閉じ括弧の中の数数えてみる種類は考えずに
    var innumber = 0
    var outnumber = 0
    // 開き括弧を一時的に保存するためのスタック
    var stack: [Character] = []
    // 対応する開き括弧を示すマップ（閉じ括弧 -> 開き括弧）
    let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    
    //    文字列を一文字ずつ判定
    for char in s {
        //        開き括弧ならスタックに追加
        if char == "(" || char == "[" || char == "{" {
            stack.append(char)
            innumber += 1
        }
        //        閉じ括弧の場合
        else if let expected = pairs[char] {
            // スタックが空、または対応していなかった場合
            if stack.isEmpty || stack.popLast() != expected {
                return false
            }
            outnumber += 1
            
            
        }
        
    }
    print(innumber, outnumber)
    // 最後にスタックが空かどうかをチェック
    return stack.isEmpty
}


// 画面に描画する
#Preview {
    ContentView()
}
