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
    
    init(id: Int, text: String) {
        self.id = id
        self.text = text
    }
    
    class func makeRequestToAPI(url: String, onCompletion:(NSDictionary) -> ()) {
        let url = NSURL.URLWithString(url)
        let request = NSURLRequest(URL:url)
        
        let task : NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            (data, response, error) in
            
            let json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as NSDictionary
            
            dispatch_async(dispatch_get_main_queue(), {
                onCompletion(json)
            })
            
        }
        task.resume()
        
    }
    
    class func getRandomJoke(jokeHandler: (Joke) -> ()) {
        Joke.makeRequestToAPI("http://api.icndb.com/jokes/random") {
            json in
            
            if let value = json["value"] as? NSDictionary {
                let remoteId = value["id"] as? Int
                let text = value["joke"] as? String
                
                let joke = Joke(id: remoteId!, text: text!)
                jokeHandler(joke)
            }
        }
    }
    
    class func getRandomJokes(count: Int, jokeHandler: ([Joke]) -> ()) {
        Joke.makeRequestToAPI("http://api.icndb.com/jokes/random/\(count)") {
            json in
            
            var jokes: [Joke] = []
            if let values = json["value"] as? NSArray {
                for value in values {
                    let remoteId = value["id"] as? Int
                    let text = value["joke"] as? String
                    
                    jokes += [Joke(id: remoteId!, text: text!)]
                }
            }
            
            jokeHandler(jokes)
            
        }
    }
    
    class func getJokeById(remoteId: Int, jokeHandler: (Joke) -> ()) {
        Joke.makeRequestToAPI("http://api.icndb.com/jokes/\(remoteId)") {
            json in
            
            
            if let value = json["value"] as? NSDictionary {
                let remoteId = value["id"] as? Int
                let text = value["joke"] as? String
                
                let joke = Joke(id: remoteId!, text: text!)
                jokeHandler(joke)
            }
        }
    }
    
    class func getAllJokes(jokeHandler: ([Joke]) -> ()) {
        Joke.makeRequestToAPI("http://api.icndb.com/jokes") {
            json in
            
            var jokes: [Joke] = []
            if let values = json["value"] as? NSArray {
                for value in values {
                    let remoteId = value["id"] as? Int
                    let text = value["joke"] as? String
                    
                    jokes += [Joke(id: remoteId!, text: text!)]
                }
            }
            
            
            jokeHandler(jokes)
        }
    }
}




