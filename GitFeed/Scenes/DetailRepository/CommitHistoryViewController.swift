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

        view.backgroundColor = .darkGray
    }
}
