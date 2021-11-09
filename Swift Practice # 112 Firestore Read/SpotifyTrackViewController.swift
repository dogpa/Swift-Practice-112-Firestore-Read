//
//  SpotifyTrackViewController.swift
//  Swift Practice # 112 Firestore Read
//
//  Created by Dogpa's MBAir M1 on 2021/11/9.
//

import UIKit
import Firebase     //導入Firebase功能
import FirebaseFirestoreSwift

class SpotifyTrackViewController: UIViewController {
    
    
    //自定義抓歌並轉型成自定義Struct的Function
    //取得Firestore.firestore()功能後指派給db
    //透過db.collection("globeFiftyTrack").getDocuments 取得資料後
    //透過guard let來取得資料後轉型成為自定義的SpotifyTrack格式
    func fetchTrackSong () {
        let db = Firestore.firestore()
        db.collection("globeFiftyTrack").getDocuments { snapshot, error in
            guard let snapshot = snapshot else {return}
            let trankSong = snapshot.documents.compactMap { snapshot in
                try? snapshot.data(as: SpotifyTrack.self)
            }
            print(trankSong)
            print("目前Firebase類型 \(type(of: trankSong))")
        }
    }
    
    
    
    //viewDidLoad內
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //將db指派為Firestore.firestore()
        let db = Firestore.firestore()

        //透過db.collection("globeFiftyTrack").getDocuments() 取得資料
        //"globeFiftyTrack"為自建立的collection的名字
        //透過querySnapshot來取得資料
        //取得失敗列印原因
        //成功的話列印所需的資料
        db.collection("globeFiftyTrack").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                print("firestore data \((querySnapshot!.documents))")
                print("\n\n")
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        
        fetchTrackSong ()
        
       
    }
    

}
