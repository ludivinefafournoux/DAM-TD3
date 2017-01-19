//
//  WebsitesTableViewController.swift
//  DAM-TD3
//
//  Created by Jonathan on 16/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit


class WebsitesTableViewController: UITableViewController {
    
    var sites = ["Facebook", "Twitter", "Google"]
    var favicon = [UIImage(named:"favicon"), UIImage(named: "faviconTwitter"), UIImage(named: "faviconTwitter")]
    var url = ["www.facebook.com", "www.twitter.com", "www.google.com"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell

        // Configure the cell...
        
        cell.title.text = sites[indexPath.row]
        cell.title.font = UIFont.boldSystemFont(ofSize: 16.0)
        cell.favicon.image = favicon[indexPath.row]
        //cell.favicon.backgroundColor = UIColor.darkGray
        cell.url.text = url[indexPath.row]
        

        return cell
    }
    
    
    // détecter la sélection d'une cellule
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        //print("You selected cell number: \(indexPath.row)!")
        print("url: \(url[indexPath.row])")
        
        // « poussez » une instance de MyWebViewController dans le navigation controller 
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewview") as? MyWebViewController {
            viewController.url = url[indexPath.row]
            viewController.titre = sites[indexPath.row]
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
                
            }
        }

    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

