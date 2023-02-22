//
//  ViewController.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/17.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

class FeedViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    var viewModel: FeedViewModel!
    weak var coordinator: FeedCoordinator?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Repositories"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        bindViewModel()
    }

    private func configureTableView() {
        let feedCellNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedCellNib, forCellReuseIdentifier: "FeedTableViewCell")
        tableView.refreshControl = UIRefreshControl()
    }

    private func bindViewModel() {
        // ?
        assert(viewModel != nil)

        // mapToVoid?
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let pull = tableView.refreshControl!.rx
            .controlEvent(.valueChanged)
            .asDriver()
        
        // merge?
        let input = FeedViewModel.Input(trigger: Driver.merge(viewWillAppear, pull),
                                        selection: tableView.rx.itemSelected.asDriver())
        
        let output = viewModel.transform(input: input)
            
        // 테이블뷰에 바인딩
        output.repos
            .drive(tableView.rx.items(
                cellIdentifier: FeedTableViewCell.reuseID,
                cellType: FeedTableViewCell.self
            )) { _, viewModel, cell in
            cell.bind(viewModel)
        }.disposed(by: disposeBag)
        
        output.fetching
            .drive(tableView.refreshControl!.rx.isRefreshing)
            .disposed(by: disposeBag)
        output.selectedRepo
            .drive()
            .disposed(by: disposeBag)
    }
}

