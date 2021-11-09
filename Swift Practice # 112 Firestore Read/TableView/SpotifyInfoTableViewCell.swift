//
//  SpotifyInfoTableViewCell.swift
//  Swift Practice # 112 Firestore Read
//
//  Created by Dogpa's MBAir M1 on 2021/11/9.
//

import UIKit

class SpotifyInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var songNameLabel: UILabel!      //歌名
        
    @IBOutlet weak var singerLabel: UILabel!        //歌手
    
    @IBOutlet weak var rankingLabel: UILabel!       //排行
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
