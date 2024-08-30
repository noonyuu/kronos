//
//  SettingView.swift
//  kronos
//
//  Created by shimizu on 2024/08/30.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 16) {
                    Divider()
                    Section {
                        VStack(spacing:0) {
                            Text("ユーザー名")
                                .font(.title2)
                            Text("アカウント情報の設定")
                                .font(.caption2)
                                .foregroundColor(.blue)
                        }
                        .frame(maxHeight: 50)
                        .padding(.leading, 24)
                        Divider()
                            .padding(.horizontal)
                        NavigationLink(destination:).navigationTitle("テーマの設定")){
                            HStack {
                                Image(systemName:"paintpalette")
                                Text("テーマの設定")
                            }
                            .foregroundColor(.black)
                        }
                        .padding(.leading, 24)
                        Divider()
                            .padding(.horizontal)
                        HStack {
                            Image(systemName:"book")
                            Text("使い方を見る")
                        }
                        .padding(.leading, 24)
                        Divider()
                            .padding(.horizontal)
                        HStack {
                            Image("contract")
                            Text("利用規約")
                        }
                            .padding(.leading, 24)
                        Divider()
                            .padding(.horizontal)
                        HStack {
                            Image("contract")
                            Text("プライバシーポリシー")
                        }                            .padding(.leading, 24)
                        Divider()
                            .padding(.horizontal)
                    }
                }
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // TODO: 戻る処理
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("設定")
                        .font(.title3)
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
