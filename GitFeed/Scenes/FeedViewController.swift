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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        bindViewModel()
    }

    private func configureTableView() {
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 64
        // ?
        tableView.rowHeight = UITableView.automaticDimension
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
        
        output.feeds.drive(tableView.rx.items(cellIdentifier: "FeedTableViewCell", cellType: FeedTableViewCell.self)) { _, viewModel, cell in
            cell.bind(viewModel)
        }.disposed(by: disposeBag)
        
        output.fetching
            .drive(tableView.refreshControl!.rx.isRefreshing)
            .disposed(by: disposeBag)
        output.selectedFeed
            .drive()
            .disposed(by: disposeBag)
    }
}

