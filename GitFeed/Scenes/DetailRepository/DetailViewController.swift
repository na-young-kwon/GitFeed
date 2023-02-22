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
    
    var viewModel: DetailViewModel!
    weak var coordinator: DetailCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        bindViewModel()
    }
    
    func bindViewModel() {

    }
    
    deinit {
        coordinator?.popDetailCoordinator()
    }
}
