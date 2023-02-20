//
//  FeedTableViewCell.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/20.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    func bind(_ viewModel: FeedItemViewModel) {
        titleLabel.text = viewModel.feed.action
        detailLabel.text = viewModel.feed.actor.name
        let data = try? Data(contentsOf: viewModel.feed.actor.avatar)
        profileImage.image = UIImage(data: data!)
    }
}
