//
//  LaunchesTableViewCell.swift
//  SpacexData
//
//  Created by Hakan on 28.04.2021.
//

import UIKit
import Kingfisher
import SwiftDate

class LaunchesTableViewCell: UITableViewCell {

    @IBOutlet weak var missionPatchImageView: UIImageView!
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var launchDateUtcLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var actionButton: SubclassedUIButton!
    
    var mvvmViewModel: LaunchesModelElement? {
        didSet {
            let url = URL(string: mvvmViewModel?.links.missionPatch ?? "")
            missionPatchImageView.kf.setImage(with: url)
            missionNameLabel.text = mvvmViewModel?.missionName
            launchDateUtcLabel.text = mvvmViewModel?.launchDateUTC.toDate()?.toFormat("dd.MM.yyyy")
            detailsLabel.text = mvvmViewModel?.details
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        missionPatchImageView.layer.cornerRadius = 10
        if #available(iOS 11.0, *) {
            missionPatchImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
