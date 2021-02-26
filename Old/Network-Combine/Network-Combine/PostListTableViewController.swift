//
//  PostListTableViewController.swift
//  Network-Combine
//
//  Created by Aaron Lee on 2020-10-17.
//

import UIKit
import Combine

class PostListTableViewController: UITableViewController {

    private var webservice = Webservice()
    private var cancellable: AnyCancellable?

    private var posts = [Post]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.cancellable = self.webservice.getPosts()
            .catch { _ in Just(self.posts) }
            .assign(to: \.posts, on: self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
        let post = self.posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }

}
