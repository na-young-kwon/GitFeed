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
        
    }
}

