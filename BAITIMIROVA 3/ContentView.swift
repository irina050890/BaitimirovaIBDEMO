//
//  ContentView.swift
//  BAITIMIROVA 3
//
//  Created by user on 25.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkBox: Bool = false
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing:10) {
                Text("Create your account")
                    .font(.system(size: 30, weight:.bold))
                    .padding(.leading,10)
                Text("Complete the sign up process to get started")
                    .padding(.leading,10)
                    .padding(.bottom,20)
                    .foregroundColor(.gray)
                Text("Full name")
                    .font(.system(size: 20))
                    .padding(.leading,10)
                    .opacity(0.5)
                TextField("Full name",text: $userViewModel.user.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading,10)
                    .foregroundColor(.gray)
                Text("Phone number")
                    .font(.system(size: 20))
                    .padding(.leading,10)
                    .foregroundColor(.gray)
                TextField("Phone number",text: $userViewModel.user.phone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading,10)
                    .foregroundColor(.gray)
                Text ("Email address")
                    .font(.system(size: 20))
                    .padding(.leading,10)
                    .foregroundColor(.gray)
                TextField("Email address",text: $userViewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading,10)
                    .foregroundColor(.gray)
                Text ("Password")
                    .font(.system(size: 20))
                    .padding(.leading,10)
                    .opacity(0.5)
                SecureField("Password",text: $userViewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading,10)
                    .foregroundColor(.gray)
                Text ("Confirm Password")
                    .font(.system(size: 20))
                    .padding(.leading,10)
                    .foregroundColor(.gray)
                SecureField("Confirm Password", text:$userViewModel.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading,10)
                    .foregroundColor(.gray)
                
                HStack{
                    CheckBox(value: $checkBox)
                    
                    Text("By ticking this box, you agree to our")
                        .foregroundColor(.gray)
                    Link ("Terms and conditions and private policy",destination: URL(string: "http://google.com")!)
                }
                .padding()
                
                NavigationLink(destination: SecondView(), isActive:
                                $userViewModel.isNavigate){}
                
                Button (action: {userViewModel.signUp()})
                //                userViewModel.isNavigate = true})
                
                {
                    Text ("Sign up")
                        .padding(.leading,30)
                        .frame(width: 360, height: 50)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 5.0))
                        .padding(.leading,15)
                }
                
                
                VStack(alignment: .center){
                    Text("Already have an account?")
                        .padding(.top,20)
                        .foregroundColor(.gray)
                                NavigationLink("Sign in", destination: SecondView())
                    Text("or sign in using")
                        .padding()
                        .foregroundColor(.gray)
                }.padding(.leading,100)
            }.navigationTitle("")
        }
    }
    struct SecondView: View {
        @State var checkBox: Bool=false
        @StateObject var userViewModel = UserViewModel()
        var body: some View {
            VStack {
                Text ("Welcome back")
                    .font(.system(size: 30,weight: .bold))
                    .padding(.leading,10)
                Text("Fill in your email and password to continue")
                    .padding(.leading,10)
                    .padding(.bottom,20)
                Text("Email Address")
                    .font(.system(size: 20))
                    .padding(.leading,10)
                    .padding(.trailing,10)
                TextField("Email Address",text: $userViewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading,10)
                Text("Password")
                    .font(.system(size: 20))
                    .padding(.leading,10)
                TextField("Password",text: $userViewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading,10)
                HStack{
                    CheckBox(value: $checkBox)
                    Text("remember password")
                    Link("Forgot password?",destination: URL(string: "http://google.com")!)
                }.padding()
                Button(action:{userViewModel.signIn()})
                {
                    Text("Log in")
                        .padding()
                        .frame(width: 360,height: 50)
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 5.0))
                }
                VStack{
                    Text("Already have an account?")
                        .padding(.top,20)
                    Link ("Sign in",destination: URL(string: "http://google.com")!)
                    Text("or sign in using")
                }
            }.navigationBarTitle("")
                
            }
        }
    }
struct ContentView_Previews: PreviewProvider{
    static var previews:some View{
        ContentView()
    }
}

#Preview {
    ContentView()
}


////  @State var countries: [Country] = []
//    @StateObject var userViewModel = UserViewModel()
//
//  var body: some View {
//
//      VStack{
//
//          Text("Create your account")
//              .padding(50)
//          Text("Full name")
//          TextField("Ivanov ivan", text: $userViewModel.user.name)
//              .padding()
//              .textFieldStyle(RoundedBorderTextFieldStyle())
//
//          Text("Phone number")
//          TextField("", text: $userViewModel.user.name)
//              .padding()
//              .textFieldStyle(RoundedBorderTextFieldStyle())
//
//          Text("Email Address)
//          TextField("*******@mail.com", text: $userViewModel.email)
//              .padding()
//              .textFieldStyle(RoundedBorderTextFieldStyle())
//      }
//    List(countries) { country in
//      Text(country.name)
//    }
//    .overlay {
//      if countries.isEmpty {
//        ProgressView()
//      }
//    }
//    .task {
//      do {
//        countries = try await supabase.from("countries").select().execute().value
//      } catch {
//        dump(error)
//      }
//    }
