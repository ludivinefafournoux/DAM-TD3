//
//  PartiesController.swift
//  DAM-TD3
//
//  Created by Laura Daufeld on 23/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit

class PartiesController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*if let url = URL(string: "http://sealounge.lanoosphere.com/seadata_en.xml") {
            do {
                
                let contents = try String(contentsOf: url)
                
                
                var xmlContent = SWXMLHash.parse(contents);
                
                
                
                //print(contents)
                
                //On récupère les éléments
                let dsf = xmlContent["Data"]["Event"].all.count;
                
                NSLog("\(dsf)");*/
        
        
        var eventArray = [Event]()
        
        
        
        
        if let url = URL(string: "http://sealounge.lanoosphere.com/seadata_en.xml") {
            do {
                let contenu = try String(contentsOf: url)
                
                let xml = SWXMLHash.parse(contenu)
                
                for index in 0...22 {
                    let id = xml["Data"]["Event"][index].element!.attribute(by: "id")!.text
                    //print(id)
                    let date = xml["Data"]["Event"][index].element!.attribute(by: "date")!.text
                    //print(date)
                    let name = xml["Data"]["Event"][index].element!.attribute(by: "name")!.text
                    //print(name)
                    let flyer = xml["Data"]["Event"][index].element!.attribute(by: "flyer")!.text
                    //print(flyer)
                    
                    var event = Event(id: Int(id)!, date: date, name: name, flyer: flyer)
                    
                    eventArray.append(event)
                    //print(event.id)
                }
            }
            catch {
                
            }
            
        }
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
