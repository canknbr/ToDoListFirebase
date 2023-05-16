//
//  ProfileView.swift
//  todoListiA
//
//  Created by Can Kanbur on 15.05.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                profile(user: user)
                }else{
                    VStack{
                        Text("Loading Profile")
                    
                    }
                }
                Spacer()
            }.navigationTitle("Profile")
        }.onAppear {
            viewModel.fetchUser()
        }
        
    }
    @ViewBuilder
    func profile(user:User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125, alignment: .center)
            .padding(.top,100)
        VStack(alignment: .leading) {
            HStack {
                Text("Name")
                Text(user.name)
            }.padding()
            HStack {
                Text("Email")
                Text(user.email)
            }.padding()
            HStack {
                Text("Member Since")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }.padding(.top,50)
        TLButton(title: "Log Out", bgColor: .red) {
            viewModel.logOut()
        }.frame(height: 40).padding().padding(.top,40)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
