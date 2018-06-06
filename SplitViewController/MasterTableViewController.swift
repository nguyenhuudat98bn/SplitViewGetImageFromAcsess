//
//  MasterTableViewController.swift
//  SplitViewController
//
//  Created by nguyễn hữu đạt on 5/28/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
protocol MonsterSelectionDelegate: class {
    func monsterSelected(_ newMonster: Monster)
}
class MasterTableViewController: UITableViewController {
    var monsters = [
        Monster(name: "Phạm Thị Hà", description: "1 Tuổi",
                iconName: "meetcatbot", weapon: .sword),
        Monster(name: "Thrers", description: "2 Tuổi",
                iconName: "meetdogbot", weapon: .blowgun),
        Monster(name: "Thrers", description: "3 Tuổi",
                iconName: "meetexplodebot", weapon: .smoke),
        Monster(name: "Thrers", description: "4 Tuổi",
                iconName: "meetfirebot", weapon: .ninjaStar),
        Monster(name: "Thrers ", description: "5 Tuổi",
                iconName: "meeticebot", weapon: .fire),
        
    ]
    weak var delegate: MonsterSelectionDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
self.splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.primaryOverlay
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMonster = monsters[indexPath.row]
        delegate?.monsterSelected(selectedMonster)
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }


    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return monsters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let monter = monsters[indexPath.row]
        cell.textLabel?.text =  monter.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            monsters.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
