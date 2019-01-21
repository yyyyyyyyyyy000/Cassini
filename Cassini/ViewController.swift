//
//  ViewController.swift
//  Cassini
//
//  Created by 无敌帅的yyyyy on 2019/1/21.
//  Copyright © 2019年 无敌帅的yyyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageview: UIImageView!
    
    var imageUrl:URL?{
        didSet{
            imageview.image = nil
            if imageview.window != nil {
                fetchimage()
            }
        }
    }
    
    
    
    private func fetchimage(){
        if let url = imageUrl{
            let dat = try? Data(contentsOf: url)
            if let data = dat{
                imageview.image = UIImage(data: data)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageview == nil {
            fetchimage()
        }
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        if imageUrl == nil{
            imageUrl = DemoUrl.picture
        }
    }
    
    

}

