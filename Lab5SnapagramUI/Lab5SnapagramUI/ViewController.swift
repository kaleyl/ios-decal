//
//  ViewController.swift
//  Lab5SnapagramUI
//
//  Created by Nikhil Yerasi on 3/4/20.
//  Copyright © 2020 nyerasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UITableViewDataSource {
    
    //reference to our model
    var feedData: FeedData!
    
    //outlets
    @IBOutlet weak var threadCollectionView: UICollectionView!
    
    @IBOutlet weak var feedTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        threadCollectionView.dataSource = self
        feedTableView.dataSource = self
        self.feedData = FeedData()
    }
    
    /*return the number of cells*/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedData.threads.count
       }
    /* return the cell for certain index*/
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item //index of item
        let thread = feedData.threads[index]
        //get the reference of the cell at the index and cast it to our threadCollectionViewCell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "threadCell", for: indexPath) as? ThreadCollectionViewCell{
            cell.emojiLabel.text = thread.emoji
            cell.nameLabel.text = thread.name
            cell.unreadLabel.text = String(thread.unread)
            
            //set colors, shape
            cell.unreadLabel.backgroundColor = Constants.snapagramBlue
            cell.unreadLabel.layer.masksToBounds = true
            cell.unreadLabel.layer.cornerRadius = (cell.unreadLabel.frame.width)/2
            
            cell.emojiLabel.layer.borderWidth = 3
            cell.emojiLabel.layer.cornerRadius = (cell.emojiLabel.frame.width)/2
            cell.emojiLabel.layer.borderColor = CGColor(srgbRed: 0, green: 224, blue: 255, alpha: 1.0)
            
            if thread.unread == 0{
                cell.unreadLabel.alpha = 0 //set transparency to 0
            }
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    /*return the number of rows*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.posts.count
    }
    
    /*return the post item at index*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let post = feedData.posts[index]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedTableViewCell {
            cell.localtionLabel.text = post.location
            cell.postImageView.image = post.image
            cell.postLabel.text = post.caption
            cell.usernameLabel.text = post.user
            return cell
        } else{
            return UITableViewCell()
        }
    }
    
    
       
    
   

}

