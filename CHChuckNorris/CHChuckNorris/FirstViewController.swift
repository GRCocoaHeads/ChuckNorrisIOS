//
//  FirstViewController.swift
//  CHChuckNorris
//
//  Created by Dan McCracken on 8/14/14.
//  Copyright (c) 2014 Sagetech, LLC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var lblJokeId : UILabel!
    @IBOutlet var lblJokeIdValue : UILabel!
    @IBOutlet var tvJokeValue : UITextView!
    @IBOutlet var imgVwChuckNorris: UIImageView!
    
    var jokeController: JokeController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        tvJokeValue.editable = false
        jokeController = appDelegate.jokeController!
        refreshJoke();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUIWithGivenJoke(joke : Joke) {
        lblJokeIdValue.text = "\(joke.id)";
        tvJokeValue.text = joke.text
        
        let imageData = NSData.dataWithContentsOfURL(joke.imgUrl, options: nil, error: nil)
        let chuckNorrisImage = UIImage(data: imageData)
        
        imgVwChuckNorris.image = chuckNorrisImage
    }
    
    @IBAction func refreshJoke() {
        jokeController.getRandomJoke (updateUIWithGivenJoke)
    }
    
}

