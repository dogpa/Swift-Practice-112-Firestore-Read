//
//  Firebase Struct.swift
//  Swift Practice # 112 Firestore Read
//
//  Created by Dogpa's MBAir M1 on 2021/11/9.
//

import Foundation
import FirebaseFirestoreSwift

struct SpotifyTrack: Identifiable, Codable {
    
    @DocumentID var id : String? //潘大寫法 要import FirebaseFirestoreSwift
    
    //官方寫法var id: String = UUID().uuidString
        
    var songName: String
    var singer: String
    var ranking: Int
}
