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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUIWithGivenJoke(joke : Joke) {
        lblJokeIdValue.text = "\(joke.id)";
        tvJokeValue.text = joke.text
    }
    
    func refreshUI() {
        Joke.getRandomJoke (updateUIWithGivenJoke)
    }
    
}

