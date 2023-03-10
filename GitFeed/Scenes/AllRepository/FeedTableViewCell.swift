//
//  FeedTableViewCell.swift
//  GitFeed
//
//  Created by κΆλμ on 2023/02/20.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(_ viewModel: FeedItemViewModel) {
        accessoryType = .disclosureIndicator
        profileImage.layer.cornerRadius = 10
        titleLabel.text = viewModel.repo.name
        nameLabel.text = viewModel.repo.owner.name
        descriptionLabel.text = viewModel.repo.description ?? ""
        starCountLabel.text = String(viewModel.repo.stars)
        languageLabel.text = viewModel.repo.language ?? ""
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
