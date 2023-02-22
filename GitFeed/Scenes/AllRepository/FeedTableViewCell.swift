//
//  FeedTableViewCell.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/20.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(_ viewModel: FeedItemViewModel) {
        profileImage.layer.cornerRadius = 25
        accessoryType = .disclosureIndicator
        titleLabel.text = viewModel.repo.name
        detailLabel.text = viewModel.repo.owner.name
        setImage(fromUrl: viewModel.repo.owner.avatar)
    }
    
    private func setImage(fromUrl url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data else { return }

            DispatchQueue.main.async {
                self.profileImage.image = UIImage(data: imageData)
            }
        }.resume()
    }
}
