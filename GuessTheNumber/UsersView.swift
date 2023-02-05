//
//  UsersView.swift
//  GuessTheNumber
//
//  Created by Jorge Giannotta on 09/05/21.
//

import SwiftUI

struct UsersView: View {
    @State var users : [User] = []
    var body: some View {
        List(users) { user in
            Text(user.name)
                
            }.onAppear{
                Api().getUser { (users) in
                    self.users = users
                }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
