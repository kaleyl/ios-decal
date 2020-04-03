//
//  ViewController.swift
//  ImagePicker
//
//  Created by RJ Pimentel on 2/20/19.
//  Copyright © 2019 RJ Pimentel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outerStack: UIStackView!
    let imagePicker = ImagePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomizeAndDisplay(self)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showImage", sender: sender)
    }
    
    @IBAction func randomizeAndDisplay(_ sender: Any) {
        let imagesToDisplay = imagePicker.randomize()
        
        var count = 0
        for view in outerStack.arrangedSubviews {
            if let innerStack = view as? UIStackView {
                for innerView in innerStack.arrangedSubviews {
                    if let button = innerView as? UIButton {
                        button.setImage(UIImage(named: imagesToDisplay[count]), for: .normal)
                        button.imageView?.contentMode = .scaleAspectFill
                        count += 1
                    }
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton, let dest = segue.destination as? ImageViewController {
            dest.imageToDisplay = button.image(for: .normal)
        }
    }
    
    


}

