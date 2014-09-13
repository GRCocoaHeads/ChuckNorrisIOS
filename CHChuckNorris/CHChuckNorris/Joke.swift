//
//  Joke.swift
//  CHChuckNorris
//
//  Created by Andrea Houg on 9/1/14.
//  Copyright (c) 2014 Sagetech, LLC. All rights reserved.
//

import Foundation

class Joke : NSObject {
    let id: Int
    let text: String
    let imgUrl: NSURL 
    let imageUrlStrings : [String] = [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbBVpys8LV7PLRowgYcmkM9QKHSfh5BwCzK46UEuFAebnJYekB",
        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTJ87pFYKnh0obZRvbCk0cJbDbr2B4O6T8egGJULWQBjaWOlYnIow",
        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTg-AK_3jAC_idnPzukfrVtO2rEKk53VzblbC3_wbJ4CWERFm4V"
    ]
    
    init(id: Int, text: String) {
        self.id = id
        self.text = text
        self.imgUrl = NSURL.URLWithString(imageUrlStrings[1])
    }
    
}




