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
    var viewModel: CommitHistoryViewModel?
    
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
        
    }
}
