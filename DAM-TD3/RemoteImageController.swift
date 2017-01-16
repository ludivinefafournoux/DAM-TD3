//
//  RemoteImageController.swift
//  DAM-TD3
//
//  Created by Jonathan on 16/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit

class RemoteImageController: UIViewController {

    var imageView : UIImageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
        
        let button1 = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button1.backgroundColor = .orange
        button1.setTitle("Test Button", for: .normal)
        button1.addTarget(self, action: #selector(buttonAction1), for: .touchUpInside)
        
        self.view.addSubview(button1)
        
        let button2 = UIButton(frame: CGRect(x: 100, y: 50, width: 100, height: 50))
        button2.backgroundColor = .blue
        button2.setTitle("Test Button", for: .normal)
        button2.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        
        self.view.addSubview(button2)
        
    }
    
    func buttonAction1(sender: UIButton!) {
        print("Button1 tapped")
        self.view.addSubview(self.imageView)
    }
    
    func buttonAction2(sender: UIButton!) {
        print("Button2 tapped")
        imageView.image = #imageLiteral(resourceName: "pandaroux")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
