//
//  CommitHistoryTableViewCell.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/23.
//

import UIKit

class CommitHistoryCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func bind(_ viewModel: CommitHistoryViewModel) {
        titleLabel.text = viewModel.commitTitle
        descriptionLabel.text = viewModel.description
        nameLabel.text = viewModel.userName
//        timeLabel.text = viewModel.time
        profileImage.layer.cornerRadius = 10
        setImage(fromUrl: viewModel.avatarURL)
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
