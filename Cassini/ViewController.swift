//
//  ViewController.swift
//  Cassini
//
//  Created by 无敌帅的yyyyy on 2019/1/21.
//  Copyright © 2019年 无敌帅的yyyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageview
    }
    
    @IBOutlet weak var scrollview: UIScrollView!{
        didSet{
            scrollview.maximumZoomScale = 25
            scrollview.minimumZoomScale = 1/25
            scrollview.addSubview(imageview)
           scrollview.delegate = self
        }
    }
    
    
    var imageview = UIImageView()
    
    private var image:UIImage?{
        get{
            return imageview.image
        }
        set{
            imageview.image = newValue
            imageview.sizeToFit()
            scrollview?.contentSize = imageview.frame.size
        }
    }
    
    var imageUrl:URL?{
        didSet{
            image = nil
           if imageview.window != nil{
                fetchimage()
            }
            
        }
    }
    
    
    
    private func fetchimage(){
        if let url = imageUrl{
            DispatchQueue.global().async {[weak self] in
                let dat = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let data = dat,self?.imageUrl == url{
                        self?.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageview.image == nil {
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

