//
//  SoundsListDetailVC.swift
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

class SoundsListDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    //    @IBOutlet ler
    @IBOutlet weak var storyListTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var storyTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var detailOverlayShadow: UIImageView!
    
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
    //    var selectedCategory = ""
    var selectedCategorySongs: [Song]! = []
    var myposition: Int = 0
    var toggleStatePlay = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slideBack()
        
        
        
        categoriesLabel.text = selectedCategoriesLabel
        storyListTitleLabel.text = selectedLandmarkName
        
        
        // Do any additional setup after loading the view.
        storyTableView.delegate = self
        storyTableView.dataSource = self
        
        //        configureSongs()
        setupImageView()
        backButonInitialUI()
        
    }
    
    private func setupImageView() {
        guard let name = imageName else { return }
        
        if let image = UIImage(named: name) {
            imageView.image = image
        }
        
        detailOverlayShadow?.image = UIImage(named: "overlayShadow")
        detailOverlayShadow?.contentMode = .scaleToFill
        detailOverlayShadow?.alpha = 0.3
        
    }
    
    //    --------------------------------------------------------------------------------------
    
    func slideBack(){
        let gestureSlideBack = UISwipeGestureRecognizer(target: self, action: #selector(self.backTapped))
        gestureSlideBack.direction = .right
        self.view.addGestureRecognizer(gestureSlideBack)
    }
    
    @IBAction func playSoundsButtonTapped(_ sender: Any) {
        
        if chosenAudioTitle == "" {
            chosenAudioTitle = selectedCategorySongs[0].title
            chosenAudioName = selectedCategorySongs[0].audioName
            chosenBackgroundImage = selectedCategorySongs[0].backgroundImageName
            chosenStoryDuration = selectedCategorySongs[0].duration
            chosenAudioType = selectedCategorySongs[0].audioType
            chosenAudioSubTitle = selectedCategorySongs[0].audioSubtitle
            performSegue(withIdentifier: "toSoundPlayerVC", sender: Any?.self)
            
            
        } else {
            performSegue(withIdentifier: "toSoundPlayerVC", sender: Any?.self)
            
            
        }
        
        
    }
    
    //    --------------------------------------------------------------------------------------
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryListCell", for: indexPath)
        
        cell.textLabel?.text = selectedCategorySongs[indexPath.item].title
        cell.detailTextLabel?.text = selectedCategorySongs[indexPath.item].duration
        
        cell.detailTextLabel?.textColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    //    --------------------------------------------------------------------------------------
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return songs.count
        return selectedCategorySongs.count
    }
    
    //    --------------------------------------------------------------------------------------
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        myposition = position
        guard let mvc = storyboard?.instantiateViewController(identifier: "SoundPlayerVC") as? SoundPlayerVC else {
            return
        }
        mvc.songs = selectedCategorySongs
        mvc.position = position
  
        performSegue(withIdentifier: "toSoundPlayerVC", sender: nil)
    }
    
    
    //    --------------------------------------------------------------------------------------
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSoundPlayerVC" {
            let destinationVC = segue.destination as! SoundPlayerVC
            
            destinationVC.songs = selectedCategorySongs
            destinationVC.position = myposition
            
        }
    }
    
    
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    func backButonInitialUI(){
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.alpha = 0.8
        backButton.backgroundColor = .white
        backButton.layer.cornerRadius = 8.0
    }

    
}
