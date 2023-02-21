//
//  FeedTableViewCell.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/20.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let profileImage: UIImageView = {
       let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .white.withAlphaComponent(0.95)
        self.configureHierarchy()
        self.configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: FeedItemViewModel) {
        titleLabel.text = viewModel.feed.action
        detailLabel.text = viewModel.feed.actor.name
        setImage(fromUrl: viewModel.feed.actor.avatar)
    }
    
    private func configureHierarchy() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.detailLabel)
    }
    
    private func configureConstraint() {
        let VStack = UIStackView(arrangedSubviews: [titleLabel, detailLabel])
        VStack.axis = .vertical
        VStack.alignment = .leading
        VStack.spacing = 4
        
        addSubview(VStack)
        VStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            VStack.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: 4
            ),
            VStack.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            VStack.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                constant: 4
            ),
            profileImage.topAnchor.constraint(equalTo: VStack.topAnchor, constant: 10),
            profileImage.bottomAnchor.constraint(equalTo: VStack.bottomAnchor, constant: 10),
            profileImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 10),
            profileImage.heightAnchor.constraint(equalToConstant: CGFloat(50)),
            profileImage.widthAnchor.constraint(equalToConstant: CGFloat(50))
        ])
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
