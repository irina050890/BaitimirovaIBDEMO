//
//  supaview.swift
//  BAITIMIROVA 3
//
//  Created by user on 25.09.2024.
//

import SwiftUI

struct ContentView: View {

//  @State var countries: [Country] = []
    @StateObject var userViewModel = UserViewModel()

  var body: some View {
      
      VStack{
          
          Text("Create your account")
              .padding(50)
          Text("Full name")
          TextField("Ivanov ivan", text: $userViewModel.user.name)
              .padding()
              .textFieldStyle(RoundedBorderTextFieldStyle())
          
          Text("Phone number")
          TextField("", text: $userViewModel.user.name)
              .padding()
              .textFieldStyle(RoundedBorderTextFieldStyle())
          
          Text("Email Address)
          TextField("*******@mail.com", text: $userViewModel.email)
              .padding()
              .textFieldStyle(RoundedBorderTextFieldStyle())
      }
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
  }
}
#Preview {
    ContentView()
}
