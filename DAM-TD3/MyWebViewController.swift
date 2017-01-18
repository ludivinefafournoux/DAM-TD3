//
//  MyWebViewController.swift
//  DAM-TD3
//
//  Created by Laura Daufeld on 18/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit

class MyWebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mywebview = UIWebView()
        
        self.view.addSubview(mywebview)
        
        // chargez l’url du site web dans la webview

    }

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
