//
//  DetailViewController.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/22.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

final class DetailViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var commitButton: UIButton!
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        profileImage.layer.cornerRadius = 12.5
        bindViewModel()
    }
    
    var detailBinding: Binder<Repository> {
        return Binder(self) { vc, repo in
            vc.userName.text = repo.owner.name
            vc.titleLabel.text = repo.name
            vc.descriptionLabel.text = repo.description ?? ""
            vc.starLabel.text = "\(repo.stars) stars"
            vc.forkLabel.text = "\(repo.forks) forks"
            self.setImage(fromUrl: repo.owner.avatar)
        }
    }
    
    private func bindViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        
        let input = DetailViewModel.Input(viewWillAppear: viewWillAppear,
                                          commitHistoryTrigger: commitButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.repo
            .drive(detailBinding)
            .disposed(by: disposeBag)
        
        output.showCommit
            .drive()
            .disposed(by: disposeBag)
    }
    
    private func setImage(fromUrl url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data else { return }

            DispatchQueue.main.async {
                self.profileImage.image = UIImage(data: imageData)
            }
        }.resume()
    }
    
    deinit {
        viewModel.popDetailCoordinator()
    }
}
