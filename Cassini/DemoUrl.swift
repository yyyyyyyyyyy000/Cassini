//
//  DemoUrl.swift
//  Cassini
//
//  Created by 无敌帅的yyyyy on 2019/1/21.
//  Copyright © 2019年 无敌帅的yyyy. All rights reserved.
//

import Foundation
struct DemoUrl{
    static let picture = Bundle.main.url(forResource: "oval", withExtension: "jpg")
    static let picture2 = URL(string: "https://upload.wikimedia.org/wikipedia/commons/5/55/Stanford_Oval_September_2013_panorama.jpg")
    
    static let NASA:Dictionary<String,URL>={
        let NASAURLStrings = ["Cassini":"https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
                              "Earth":"https://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
                              "Saturn":"https://www.nasa.gov/sites/default/files/saturn_collage.jpg"]
        var urls = Dictionary<String,URL>()
        for(key,value) in NASAURLStrings{
            urls[key] = URL(string: value)
        }
        return urls
    }()
    
}
