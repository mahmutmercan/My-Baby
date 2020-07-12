//
//  ImageViewerViewController.swift
//  MR.Baby
//
//  Created by İlker isa Mercan on 4.07.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import UIKit

struct Song {
    let title: String
    let audioSubtitle: String
    let backgroundImageName: String
    let duration: String
    let audioName: String
    let audioType: String
    
}

class ImageViewerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

//    @IBOutlet ler
    @IBOutlet weak var storyListTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var storyTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var imageName: String!
    
//    Struck Gönderme
    var chosenAudioTitle = ""
    var chosenAudioSubTitle = ""
    var chosenBackgroundImage = ""
    var chosenStoryDuration = ""
    var chosenAudioName = ""
    var chosenAudioType = ""
//    var chosenNextAudioTitle = ""
    
//    Struck Çekme
    var selectedCategoriesLabel = ""
    var selectedLandmarkName = ""
    
    var toggleStatePlay = 1


    var songs: [Song] = [
        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]
    
//    --------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        categoriesLabel.text = selectedCategoriesLabel
        storyListTitleLabel.text = selectedLandmarkName

        // Do any additional setup after loading the view.
        storyTableView.delegate = self
        storyTableView.dataSource = self

        setupImageView()
    
    }
    
//    --------------------------------------------------------------------------------------

    
    private func setupImageView() {
        guard let name = imageName else { return }
        
        if let image = UIImage(named: name) {
            imageView.image = image
        }
    }
    
//    --------------------------------------------------------------------------------------
    
    
    
    @IBAction func playSoundsButtonTapped(_ sender: Any) {
        
        if chosenAudioTitle == "" {
            chosenAudioTitle = songs[0].title
            chosenAudioName = songs[0].audioName
            chosenBackgroundImage = songs[0].backgroundImageName
            chosenStoryDuration = songs[0].duration
            chosenAudioType = songs[0].audioType
            chosenAudioSubTitle = songs[0].audioSubtitle
                performSegue(withIdentifier: "toStoryDetailViewController", sender: Any?.self)

            
        } else {
            performSegue(withIdentifier: "toStoryDetailViewController", sender: Any?.self)

            
        }


    }
    
//    --------------------------------------------------------------------------------------

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryListCell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.item].title
        cell.detailTextLabel?.text = songs[indexPath.item].duration
        return cell
    }
    
//    --------------------------------------------------------------------------------------

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
//    --------------------------------------------------------------------------------------

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        chosenAudioTitle = songs[indexPath.row].title
        chosenAudioName = songs[indexPath.row].audioName
        chosenBackgroundImage = songs[indexPath.row].backgroundImageName
        chosenStoryDuration = songs[indexPath.row].duration
        chosenAudioType = songs[indexPath.row].audioType
        chosenAudioSubTitle = songs[indexPath.row].audioSubtitle
        
        
        
        performSegue(withIdentifier: "toStoryDetailViewController", sender: nil)
    }
    
    
//    --------------------------------------------------------------------------------------

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStoryDetailViewController" {
            let destinationVC = segue.destination as! storyDetailViewController
            
            destinationVC.selectedAudioTitle = chosenAudioTitle
            destinationVC.selectedAudioName = chosenAudioName
            destinationVC.selectedBackgroundImage = chosenBackgroundImage
            destinationVC.selectedStoryDuration = chosenStoryDuration
            destinationVC.selectedAudioType = chosenAudioType
            destinationVC.selectedAudioSubtitle = chosenAudioSubTitle
            
        }
    }
    
//    --------------------------------------------------------------------------------------

    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
//    --------------------------------------------------------------------------------------

    
}
