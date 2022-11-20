//
//  ChatManager.swift
//  LetsChat
//
//  Created by aleksandar on 17.11.22..
//

import Foundation
import StreamChat
import StreamChatUI

final class ChatManager {
    static let shared = ChatManager()
    
    private var client: ChatClient!
    
    private let tokens = [
        "stevejobs" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3RldmVqb2JzIn0.JTB29MpIdcHRSqCimGhbNp99YzPhtOiJaZVokevUiqw",
        "zukemberg" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoienVrZW1iZXJnIn0.BGrJJ8v7a_olevrDEIfHRbu_mJ1XHxgtK-WG61YIbN8"
    ]
    
    func setUp() {
        let client = ChatClient(config: .init(apiKey: .init("wprbt4v7ehah")))
        self.client = client
    }
    
    //Authentication
    
    func signIn(with username: String, completion: @escaping (Bool) -> Void) {
        guard !username.isEmpty else {
            completion(false)
            return
        }
        
        guard let token = tokens[username.lowercased()] else { completion(false); return }
        
        client.connectUser(
            userInfo: UserInfo(id: username, name: username),
            token: Token(stringLiteral: token)) { error in
                completion(error == nil)
            }
    }
    
    func signOut() {
        client.disconnect()
    }
    
    var isSignedIn: Bool {
        return client.currentUserId != nil
    }
    
    var currentUser: String? {
        return client.currentUserId
    }
    
    //Channel list + Creation
    
    public func createChannelList() -> UIViewController? {
        guard let id = currentUser else { return nil }
        let list = client.channelListController(query: .init(filter: .containMembers(userIds: [id])))
        let vc = ChatChannelListVC()
        vc.content = list
        
        list.synchronize()
        return vc
    }
    
    public func createNewChannel(name: String) {
        guard let current = currentUser else { return }
        let keys = tokens.keys.filter {
            $0 != current
        }.map { $0 }
        do {
            let result = try client.channelController(
                createChannelWithId: .init(type: .messaging, id: name),
                name: name,
                members: Set(keys),
                isCurrentUserMember: true
            )
            result.synchronize()
        } catch {
            print(error)
        }
    }
}
