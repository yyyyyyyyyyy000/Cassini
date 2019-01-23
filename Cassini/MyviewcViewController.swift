//
//  MyviewcViewController.swift
//  Cassini
//
//  Created by 无敌帅的yyyyy on 2019/1/21.
//  Copyright © 2019年 无敌帅的yyyy. All rights reserved.
//

import UIKit

class MyviewcViewController: UIViewController {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if let url = DemoUrl.NASA[identifier]{
                if let imageVC = segue.destination.content as? ViewController{
                    imageVC.imageUrl = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
            
        }
        
        
    }
    
}
extension UIViewController{
    var content:UIViewController{
        if let navcon = self as? UINavigationController{
            return navcon.visibleViewController ?? navcon
        }else{
            return self
        }
    }
}
