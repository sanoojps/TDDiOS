//
//  People.swift
//  TDDiOS
//
//  Created by sanooj on 11/13/17.
//  Copyright © 2017 sanooj. All rights reserved.
//

import Foundation

class Person
{
    var name:String
    var avatar:URL?
    
    init(withName name:String, andAvatar avatarLocation:String)
    {
        self.name =
        name
        
        self.avatar =
        URL.init(string: avatarLocation)
    }
}
