//
//  CommitHistoryTableViewCell.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/23.
//

import UIKit

class CommitHistoryCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
        
        selectionStyle = .none
     }
     
// TODO: - 시간 가져온거 timeLabel에 표시하기

    func bind(_ viewModel: CommitItemViewModel) {
        titleLabel.text = viewModel.commitMessage
//        timeLabel.text = viewModel.time
        nameLabel.text = viewModel.userName
        profileImage.layer.cornerRadius = 10
        setImage(fromUrl: viewModel.profileURL)
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
