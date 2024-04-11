//
//  ContentView.swift
//  Firebase_test4
//
//  Created by Taka on 2024/03/30.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct NewAccountView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignUpSuccess: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Sign In") {
                    print("Sign In")
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        guard let user = authResult?.user else {
                            return
                            if let error = error as NSError?, let errorCode = AuthErrorCode.Code(rawValue: error._code) {
                                switch errorCode {
                                case .invalidEmail:
                                    
                                    ""
                                case .weakPassword:
                                    
                                    ""
                                case .wrongPassword:
                                    
                                    ""
                                case .userNotFound:
                                    
                                    ""
                                case .networkError:
                                    
                                    ""
                                default:
                                    
                                    print("default")
                                }
                            }
                        }
                        print("サインイン成功")
                    }
                }
                .padding()
                
                Button("Register") {
                    print("Register")
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        guard let _ = authResult?.user, error == nil else {
                            print("Sign up failed: \(error?.localizedDescription ?? "Unknown error")")
                            return
                        }
                        print("Sign up successful")
                        isSignUpSuccess = true
                    }
                }
                .padding()
                
                GoogleAccountLogin()
                    .padding()
                
                Button("Account delete") {
                    print("Account delete")
                    let user = Auth.auth().currentUser
                    user?.delete { error in
                        if let error {
                            print("削除できませんでした")
                        } else {
                            print("削除しました")
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Sign Up", displayMode: .inline)
            .background(
                NavigationLink(
                    destination: AccountRegistrationView(),
                    isActive: $isSignUpSuccess) { EmptyView() }
                    .hidden() // 非表示にする
            )
        }
    }
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
