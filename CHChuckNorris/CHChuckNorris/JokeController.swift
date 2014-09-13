//
//  JokeController.swift
//  CHChuckNorris
//
//  Created by Carlus Henry on 9/13/14.
//  Copyright (c) 2014 Sagetech, LLC. All rights reserved.
//

import Foundation

class JokeController {
    func makeRequestToAPI(url: String, onCompletion:(NSDictionary) -> ()) {
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
    
    func getRandomJoke(jokeHandler: (Joke) -> ()) {
        makeRequestToAPI("http://api.icndb.com/jokes/random") {
            json in
            
            if let value = json["value"] as? NSDictionary {
                let remoteId = value["id"] as? Int
                let text = value["joke"] as? String
                
                let joke = Joke(id: remoteId!, text: text!)
                jokeHandler(joke)
            }
        }
    }
    
    func getRandomJokes(count: Int, jokeHandler: ([Joke]) -> ()) {
        makeRequestToAPI("http://api.icndb.com/jokes/random/\(count)") {
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
    
    func getJokeById(remoteId: Int, jokeHandler: (Joke) -> ()) {
        makeRequestToAPI("http://api.icndb.com/jokes/\(remoteId)") {
            json in
            
            
            if let value = json["value"] as? NSDictionary {
                let remoteId = value["id"] as? Int
                let text = value["joke"] as? String
                
                let joke = Joke(id: remoteId!, text: text!)
                jokeHandler(joke)
            }
        }
    }
    
    func getAllJokes(jokeHandler: ([Joke]) -> ()) {
        makeRequestToAPI("http://api.icndb.com/jokes") {
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