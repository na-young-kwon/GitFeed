//
//  CommitHistoryViewController.swift
//  GitFeed
//
//  Created by 권나영 on 2023/02/23.
//

import UIKit
import Domain
import RxSwift
import RxCocoa

class CommitHistoryViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var viewModel: CommitHistoryViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Commits"
        configureTableView()
        bindViewModel()
    }
    
    private func configureTableView() {
        let feedCellNib = UINib(nibName: CommitHistoryCell.reuseID, bundle: nil)
        tableView.register(feedCellNib, forCellReuseIdentifier: CommitHistoryCell.reuseID)
        tableView.refreshControl = UIRefreshControl()
    }
    
    private func bindViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let pull = tableView.refreshControl!.rx
            .controlEvent(.valueChanged)
            .asDriver()
        
        let input = CommitHistoryViewModel.Input(trigger: Driver.merge(viewWillAppear, pull))
                                                 
        let output = viewModel.transform(input: input)
        
        output.commits
            .drive(tableView.rx.items(
                cellIdentifier: CommitHistoryCell.reuseID,
                cellType: CommitHistoryCell.self)) { _, viewModel, cell in
                    cell.bind(viewModel)
                }.disposed(by: disposeBag)
                                          
        output.fetching
            .drive(tableView.refreshControl!.rx.isRefreshing)
            .disposed(by: disposeBag)
    }
}
