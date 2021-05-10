//
//  MyGroupViewController.swift
//  VK
//
//  Created by пользовтель on 10.03.2021.
//

import UIKit

class MyGroupViewController: UIViewController {

    var myGroup: [Group] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBOutlet weak var myGroupTableView: UITableView! {
        didSet {
            myGroupTableView.delegate = self
            myGroupTableView.dataSource = self
        }
    }

}
extension MyGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroup.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myGroupTableView.dequeueReusableCell(withIdentifier: "reusableCell") as! UserTableViewCell
        let avatar = myGroup[indexPath.row].avatar
        let url = URL(string: avatar)
        let data = try? Data(contentsOf: url!)

        if let imageData = data {
            let image = UIImage(data: imageData)
            cell.avatarImage.image = image
        }
        cell.nameLabl.text = myGroup[indexPath.row].name
        return cell
    }
    
    @IBAction func addGroup (segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup",
        let sourceVC = segue.source as? GlobalGroupViewController,
        let selectedGroup = sourceVC.selectedGroup,
        let selectedGroupName = sourceVC.selectedGroup?.name{
            if !myGroup.contains(where: { $0.name == selectedGroupName }) {
            
                myGroup.append(selectedGroup)
            myGroupTableView.reloadData()
            }
        }
    }
    
}
