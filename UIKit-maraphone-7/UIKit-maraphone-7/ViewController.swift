//
//  ViewController.swift
//  UIKit-maraphone-7
//
//  Created by kamaz on 20.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        let imageContainerView = ImageContainerView()
        tableView.tableHeaderView = imageContainerView
        tableView.scrollIndicatorInsets = UIEdgeInsets(
            top: imageContainerView.bounds.height, left: 0, bottom: 0, right: 0
        )
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? ImageContainerView else {
            return
        }
        header.scrollViewDidScroll(scrollView: scrollView)

        let offsetY = -(scrollView.contentOffset.y + view.safeAreaInsets.top)
        let height = header.bounds.height + offsetY

        tableView.scrollIndicatorInsets = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}


