//
//  ApiManager.swift
//  KGMart
//
//  Created by Gulzat on 14/11/23.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase
import Firebase

class ApiManager {
    
    static let shared = ApiManager()
    
    private func configureFB() -> Firestore {
        var db: Firestore
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        return db
    }
}
