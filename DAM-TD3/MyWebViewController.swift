//
//  MyWebViewController.swift
//  DAM-TD3
//
//  Created by Laura Daufeld on 18/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit

class MyWebViewController: UIViewController {
    
    public var url: String = ""
    public var titre: String = ""
    var toolBar:UIToolbar = UIToolbar()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("la")
        
        //let mywebview = UIWebView()
        
        self.view.addSubview(mywebviewoutlet)
        
        // change titre navigation bar
        self.navigationItem.title = titre
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: mywebviewoutlet, action: #selector(mywebviewoutlet.reload))
        toolbarItems = [spacer, refresh]
        
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.toolbar.barStyle = UIBarStyle.black
        navigationController?.isToolbarHidden = false
        
        // Toolbar
        toolBar.frame = self.view.bounds
        toolBar.sizeToFit()
        toolBar.setItems(toolbarItems, animated: true)
        toolBar.barStyle = UIBarStyle.black
        view.addSubview(toolBar)
        
        
        // chargez l’url du site web dans la webview
        mywebviewoutlet.loadRequest(NSURLRequest(url: NSURL(string: "http://\(url)")! as URL) as URLRequest)
        
        

    }

    @IBOutlet weak var mywebviewoutlet: UIWebView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
