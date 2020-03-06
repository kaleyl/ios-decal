//
//  ImagePicker.swift
//  ImagePicker
//
//  Created by RJ Pimentel on 2/20/19.
//  Copyright © 2019 RJ Pimentel. All rights reserved.
//

import Foundation

class ImagePicker {
    let imageNames = ["image-1", "image-2", "image-3", "image-4", "image-5", "image-6", "image-7", "image-8", "image-9", "image-10", "image-11", "image-12", "image-13"]
    
    func randomize() -> [String] {
        var images = [String]()
        while images.count < 12 {
            let index = Int.random(in: 0...12)
            let image = imageNames[index]
            if !images.contains(image) {
                images.append(image)
            }
        }
       return images
    }
}
