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
    
// TODO: - 커밋메시지 \n으로 구분해서 descriptionLabel에도 글자넣기
// TODO: - descriptionLabel 유무에따라 다이나믹 테이블뷰 구현
// TODO: - 시간 가져온거 timeLabel에 표시하기

    func bind(_ viewModel: CommitItemViewModel) {
        titleLabel.text = viewModel.commitMessage
        descriptionLabel.text = ""
//        descriptionLabel.text = viewModel.description
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
