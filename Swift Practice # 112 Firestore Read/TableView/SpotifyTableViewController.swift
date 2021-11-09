//
//  SpotifyTableViewController.swift
//  Swift Practice # 112 Firestore Read
//
//  Created by Dogpa's MBAir M1 on 2021/11/9.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class SpotifyTableViewController: UITableViewController {
    
    var songArray = [SpotifyTrack]()
    
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
            self.songArray = trankSong
            print(trankSong)
            print("目前Firebase類型 \(type(of: trankSong))")
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchTrackSong ()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SpotifyInfoTableViewCell", for: indexPath) as? SpotifyInfoTableViewCell else {return UITableViewCell()}

        cell.songNameLabel.text = songArray[indexPath.row].songName
        cell.singerLabel.text = songArray[indexPath.row].singer
        cell.rankingLabel.text = String(songArray[indexPath.row].ranking)

        return cell
    }
    

}
