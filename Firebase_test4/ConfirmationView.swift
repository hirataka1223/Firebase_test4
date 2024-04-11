//
//  ConfirmationView.swift
//  Firebase_test4
//
//  Created by Taka on 2024/04/07.
//

import SwiftUI

struct ConfirmationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let selectedSNS: String
    let selectedGenre: String
    let accountName: String
    let fanCount: String
    let url: String
    
    @State private var isRegistrationComplete: Bool = false // 追加
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("確認ページ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("ツール1")
                        .font(.headline)
                    HStack {
                        Text("　SNSツール:")
                        Spacer()
                        Text(selectedSNS)
                            .font(.headline)
                    }
                    
                    HStack {
                        Text("　ジャンル:")
                        Spacer()
                        Text(selectedGenre)
                            .font(.headline)
                    }
                    
                    HStack {
                        Text("　アカウント名:")
                        Spacer()
                        Text(accountName)
                            .font(.headline)
                    }
                    
                    HStack {
                        Text("　\(fanCountTitle()):")
                        Spacer()
                        Text(fanCount)
                            .font(.headline)
                    }
                    
                    HStack {
                        Text("　URL:")
                        Spacer()
                        Text(url)
                            .font(.headline)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                        print("登録完了前: \(isRegistrationComplete)")
                        isRegistrationComplete = true
                        print("登録完了後: \(isRegistrationComplete)")
                    })  {
                        Text("登録する")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // 修正処理
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("修正する")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            .navigationBarTitle("", displayMode: .inline) // NavigationBarTitleの追加
            .background(
                NavigationLink(destination: MyPageView(email: "", selectedSNS: selectedSNS, selectedGenre: selectedGenre, accountName: accountName, fanCount: fanCount, url: url), isActive: $isRegistrationComplete) {
                    EmptyView()
                }
                    .hidden()
            )
        }
    }
    
    // ファン数のタイトルを選択されたSNSツールに応じて変更するメソッド
    private func fanCountTitle() -> String {
        if selectedSNS == "Youtube" {
            return "チャンネル登録者数"
        } else {
            return "フォロワー数"
        }
    }
}




struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(selectedSNS: "Youtube", selectedGenre: "音楽", accountName: "サンプルアカウント", fanCount: "1000", url: "https://example.com")
    }
}


