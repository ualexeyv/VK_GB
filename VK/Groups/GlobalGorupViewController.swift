//
//  GlobalGorupViewController.swift
//  VK
//
//  Created by пользовтель on 10.03.2021.
//

import UIKit

class GlobalGroupViewController: UIViewController {
    let VKServ = VKService()
    var selectedGroup: Group?
    var selectedGroupName: String?
    
    var groupsAF: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {[weak self] in
            self?.VKServ.loadGlobalGroup(extraPath: "groups.get", completion: { [weak self] groups in
                self?.groupsAF = groups
                print (groups.map { $0.name})
                self!.globalGroupTableView.reloadData()
            })
        }
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var globalGroupTableView: UITableView! {
        didSet {
            globalGroupTableView.delegate = self
            globalGroupTableView.dataSource = self
        }
    }

}
extension GlobalGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groupsAF.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = globalGroupTableView.dequeueReusableCell(withIdentifier: "reusableCell") as! UserTableViewCell
        
        cell.nameLabl.text = groupsAF[indexPath.row].name
        let url = URL(string: groupsAF[indexPath.row].avatar)
        cell.avatarImage.image = convertUrlToImage(url: url!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedGroup = groupsAF[indexPath.row]
        selectedGroupName = groupsAF[indexPath.row].name
        performSegue(withIdentifier: "addGroup", sender: nil)
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


