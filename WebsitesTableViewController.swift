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
    var favicon = [UIImage(named:"favicon"), UIImage(named: "faviconTwitter"), UIImage(named: "favicon-Google-2015")]
    var url = ["www.facebook.com", "www.twitter.com", "www.google.com"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    
    // UIAlertController, ajout d'un site web
    @IBAction func addAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Sites", message: "Ajouter un site web", preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            //This is called when the user presses the cancel button.
            print("You've pressed the cancel button")
        }
        
        let actionAdd = UIAlertAction(title: "Ajouter", style: .default) { (action:UIAlertAction) in
            //This is called when the user presses the add button.
            let textNom = alertController.textFields![0] as UITextField
            let textURL = alertController.textFields![1] as UITextField
            
            self.sites.append(String(describing: textNom.text!))
            //print(textNom.text!)
            self.url.append(String(describing: textURL.text!))
            //print(textURL.text!)
            self.favicon.append(UIImage())
            
            // recharge la tableview
            self.tableView.reloadData()
            
            print("The user entered: ",textNom.text!,textURL.text!)
        }
        
        alertController.addTextField { (textField) -> Void in
            //Configure the attributes of the first text box.
            textField.placeholder = "Nom"
        }
        
        alertController.addTextField { (textField) -> Void in
            //Configure the attributes of the second text box.
            textField.placeholder = "URL"
            //textField.secureTextEntry = true
        }
        
        //Add the buttons
        alertController.addAction(actionCancel)
        alertController.addAction(actionAdd)
        
        //Present the alert controller
        self.present(alertController, animated: true, completion:nil)
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
        //print("url: \(url[indexPath.row])")
        
        // « poussez » une instance de MyWebViewController dans le navigation controller 
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "viewview") as? MyWebViewController {
            viewController.url = url[indexPath.row] // passage de l'url
            viewController.titre = sites[indexPath.row] // passage du nom du site
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


extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in guard
                
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
            else { return }
            
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
        }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

