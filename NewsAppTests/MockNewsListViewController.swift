//
//  MockNewsListViewController.swift
//  NewsAppTests
//
//  Created by donghyeon on 2022/03/13.
//

import Foundation
@testable import NewsApp

final class MockNewsListViewController: NewsListProtocol {
    var isCalledSetupNavigationBar = false
    var iscalledSetupLayout = false
    var iscalledEndRefreshing = false
    var iscalledmoveToNewsWebViewController = false
    var iscalledreloadTableView = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupLayout() {
        iscalledSetupLayout = true
    }
    
    func endRefreshing() {
        iscalledEndRefreshing = true
    }
    
    func moveToNewsWebViewController(with news: News) {
        iscalledmoveToNewsWebViewController = true
    }
    
    func reloadTableView() {
        iscalledreloadTableView = true
    }
}
