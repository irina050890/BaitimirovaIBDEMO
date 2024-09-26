//
//  Reposetories.swift
//  BAITIMIROVA 3
//
//  Created by user on 25.09.2024.
//
import Foundation
import Supabase

class Repositories {
              // паттерн instance
    static let instance = Repositories()

    // подключение supabase
    let supabase = SupabaseClient(
        supabaseURL: URL(string: "https://pboglylonhaxacfdybxv.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBib2dseWxvbmhheGFjZmR5Ynh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjcyMzE4OTQsImV4cCI6MjA0MjgwNzg5NH0.Ftvojo4YQy9hx7t8TH5ZcaRPnciYXlNwsVLLkBERUNw",
        options: .init())
    
  
// регистрация в supabase
    func signUp(name: String, phone: String, email: String, password: String) async throws {
        try await supabase.auth.signUp(email: email, password: password)
        let user = try await supabase.auth.session.user
        
        let newUser = UserModel(id: user.id, name: name, phone: phone, created_at: .now)
        
        try await supabase.from("users")
            .insert(newUser)
            .execute()
        
        try await supabase.auth.signOut()
    }
    
  // авторизация
      func signIn(name: String, phone: String, email: String, password: String) async throws {
          try await supabase.auth.signIn(email: email, password: password)
          let user = try await supabase.auth.session.user
          
          let newUser = UserModel(id: user.id, name: name, phone: phone, created_at: .now)
          
          try await supabase.from("users")
              .insert(newUser)
              .execute()
          
          try await supabase.auth.signOut()
      }
      
    
    }
