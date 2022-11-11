//
//  Login.swift
//
//  Created by cyw on 7/11/22.
//

import SwiftUI

struct Login: View {
    @StateObject var vm = ViewModel.vm
    @State var loginState = 1
    @State var username = ""
    @State var password = ""
    @State var message = ""
    @State var showingAlert = false
    var body: some View {
        NavigationView {
            VStack {
                Image("location")
                    .resizable()
                    .scaledToFit()
                Text("Hi, nice to meet you ! \(username)")
                    .font(.title)
                    .bold()
                Text("Provide your personal Information to find \n textbooks you are looking for. ")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    .padding(.all, 20)
                
                if (loginState == 0) {
                    NavigationLink(
                        destination: NavBar().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                        label: {
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                
                                Text("Tap to Begin")
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                
                            }
                            .frame(width: 300, height: 60, alignment: .center)
                            
                            .border(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)), width: 3)
                            .cornerRadius(5)
                        }).padding(.top, 40)
                } else if (loginState == 1){
                    VStack {
                        Color("BgColor").edgesIgnoringSafeArea(.all)
                        VStack {
                            Spacer()
                            
                            VStack {
                                Text("Sign In")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.bottom, -10)
                                    .padding(.top, -15)
                                
                                
                                
                                TextField("Username", text: $username)
                                    .font(.title3)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(50.0)
                                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                                    .padding()
                                TextField("Password", text: $password)
                                    .font(.title3)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(50.0)
                                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                                    .padding()
                            }
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                
                                Text("Tap to Begin")
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                
                            }
                            .frame(width: 300, height: 60, alignment: .center)
                            .border(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)), width: 3)
                            .cornerRadius(5)
                            .onTapGesture {
                                
                                let res = vm.login(username: username, password: password)
                                message = res.1
                                
                                if res.0 {
                                    withAnimation{loginState = 0}
                                } else {
                                    showingAlert = true
                                }
                                
                            }.alert("\(message)", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                        }
                    }
                } else if (loginState == 2) {
                    VStack {
                        Color("BgColor").edgesIgnoringSafeArea(.all)
                        VStack {
                            Spacer()
                            
                            VStack {
                                Text("Register")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.bottom, -10)
                                    .padding(.top, -20)
                                
                                
                                TextField("Username", text: $username)
                                    .font(.title3)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(50.0)
                                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                                    .padding()
                                TextField("Password", text: $password)
                                    .font(.title3)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.white)
                                    .cornerRadius(50.0)
                                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                                    .padding()
                            }
                            HStack {
                                Image(systemName: "location.fill")
                                    .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                
                                Text("Tap to Register")
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                                
                                
                            }
                            .frame(width: 300, height: 50, alignment: .center)
                            .border(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)), width: 3)
                            .cornerRadius(5)
                            .onTapGesture {
                                
                                if (vm.makeregister(username: username, password: password)) {
                                    withAnimation{loginState = 0}
                                } else {
                                    showingAlert = true
                                }
                                
                                
                            }.alert("Important message", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                        }
                    }
                }
                if (loginState > 0) {
                    Text(loginState == 1 ? "Or Register" : "Or Login")
                        .bold()
                        .underline()
                        .foregroundColor(.gray)
                        .padding(.top, 10).onTapGesture {
                            withAnimation{loginState == 1 ? (loginState = 2) : (loginState = 1)}
                        }
                }
                
                Spacer()
                
                
                
            }
        }
        
    }
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
