//
//  ViewController.swift
//  MR.Baby
//
//  Created by İlker isa Mercan on 4.07.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import FirebaseCrashlytics

struct Item {
    var title: String
    var audioCoverImage: String
    var audioPackageCount: String
    var AudioPackageCoverImage: String
    var audioCategory: String
    var songs: [Song]
}

class ViewController: UIViewController {
    
//    IBOutlet ler
    @IBOutlet weak var collectionView: UICollectionView!
    
//    Struck Gönderme
    var storyDetailTitle = [String]()
    var selectedTitle = ""
    var chosenLandmarkName = ""
    var chosenCategoriesLabel = ""
    var choosenCategory = ""
    var choosenSongs: [Song]! = []
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "ItemCollectionViewCell"
    let viewImageSegueIdentifier = "viewImageSegueIdentifier"

    var items: [Item] = [
        Item(title: "", audioCoverImage: "categories", audioPackageCount: "", AudioPackageCoverImage: "", audioCategory: "",songs: []),
        
        Item(title: "Sweet Dream", audioCoverImage: "categoryLullaby2", audioPackageCount: "2", AudioPackageCoverImage: "categoryLullaby2", audioCategory: "Lullaby 2",songs: [
            Song(title: "Sweet Dream 1", audioSubtitle: "Anonim", backgroundImageName: "lullaby2Detail", duration: "02:51", audioName: "catLullaby2_item0", audioType: "mp3"),
            Song(title: "Sweet Dream 2", audioSubtitle: "Anonim", backgroundImageName: "lullaby2Detail", duration: "03:27", audioName: "catLullaby2_item1", audioType: "mp3"),
            Song(title: "Sweet Dream 3", audioSubtitle: "Anonim", backgroundImageName: "lullaby2Detail", duration: "08:24", audioName: "catLullaby2_item2", audioType: "mp3"),
            Song(title: "Sweet Dream 4", audioSubtitle: "Anonim", backgroundImageName: "lullaby2Detail", duration: "01:12", audioName: "catLullaby2_item3", audioType: "mp3"),
            Song(title: "Sweet Dream 5", audioSubtitle: "", backgroundImageName: "lullaby2Detail", duration: "21:35", audioName: "catLullaby2_item4", audioType: "mp3"),
            Song(title: "Sweet Dream 6", audioSubtitle: "Anonim", backgroundImageName: "lullaby2Detail", duration: "08:24", audioName: "catLullaby2_item5", audioType: "mp3")]),
        
        Item(title: "Lullaby", audioCoverImage: "categoryLullaby", audioPackageCount: "2", AudioPackageCoverImage: "categoryLullaby", audioCategory: "Lullaby 1",songs: [
            Song(title: "Lullaby 1", audioSubtitle: "", backgroundImageName: "lullaby1Detail", duration: "29:10", audioName: "SleepLullaby1", audioType: "mp3"),
            Song(title: "Lullaby 2", audioSubtitle: "", backgroundImageName: "lullaby1Detail", duration: "15:00", audioName: "SleepLullaby2", audioType: "mp3"),
            Song(title: "Lullaby 3", audioSubtitle: "", backgroundImageName: "lullaby1Detail", duration: "03:16", audioName: "SleepLullaby3", audioType: "mp3"),
            Song(title: "Lullaby 4", audioSubtitle: "", backgroundImageName: "lullaby1Detail", duration: "01:20", audioName: "SleepLullaby4", audioType: "mp3"),
            Song(title: "Lullaby 5", audioSubtitle: "", backgroundImageName: "lullaby1Detail", duration: "02:15", audioName: "SleepLullaby5", audioType: "wav"),
            Song(title: "Lullaby 6", audioSubtitle: "", backgroundImageName: "lullaby1Detail", duration: "01:16", audioName: "SleepLullaby6", audioType: "mp3"),
            Song(title: "Lullaby 7", audioSubtitle: "", backgroundImageName: "lullaby1Detail", duration: "01:15", audioName: "SleepLullaby7", audioType: "mp3"),]),
        
        Item(title: "Moon Songs", audioCoverImage: "categoryLullaby3", audioPackageCount: "3", AudioPackageCoverImage: "categoryLullaby3", audioCategory: "Lullaby", songs: [
            Song(title: "Moon Songs 1", audioSubtitle: "", backgroundImageName: "moonSong", duration: "00:54", audioName: "catLullaby3_item0", audioType: "mp3"),
            Song(title: "Moon Songs 2", audioSubtitle: "", backgroundImageName: "moonSong", duration: "02:22", audioName: "catLullaby3_item1", audioType: "mp3"),
            Song(title: "Moon Songs 3", audioSubtitle: "", backgroundImageName: "moonSong", duration: "01:40", audioName: "catLullaby3_item2", audioType: "wav"),
            Song(title: "Moon Songs 4", audioSubtitle: "", backgroundImageName: "moonSong", duration: "18:44", audioName: "catLullaby3_item3", audioType: "mp3"),
            Song(title: "Moon Songs 5", audioSubtitle: "", backgroundImageName: "moonSong", duration: "38:03", audioName: "catLullaby3_item4", audioType: "mp3"),
            Song(title: "Moon Songs 7", audioSubtitle: "", backgroundImageName: "moonSong", duration: "21:35", audioName: "catLullaby3_item5", audioType: "mp3")]),
        
        Item(title: "Boy", audioCoverImage: "categoryBoy", audioPackageCount: "2", AudioPackageCoverImage: "categoryBoy", audioCategory: "Lullaby",songs: [
            Song(title: "Sleep", audioSubtitle: "", backgroundImageName: "boyDetail", duration: "29:10", audioName: "SleepBoy1", audioType: "mp3"),
            Song(title: "Song 1", audioSubtitle: "", backgroundImageName: "boyDetail", duration: "19:00", audioName: "SleepBoy2", audioType: "mp3"),
            Song(title: "Sleep", audioSubtitle: "", backgroundImageName: "boyDetail", duration: "03:06", audioName: "SleepBoy3", audioType: "mp3"),
            Song(title: "Sleep", audioSubtitle: "", backgroundImageName: "boyDetail", duration: "03:21", audioName: "SleepBoy4", audioType: "mp3"),
            Song(title: "Sleep", audioSubtitle: "", backgroundImageName: "boyDetail", duration: "03:25", audioName: "SleepBoy5", audioType: "mp3"),
            Song(title: "Sleep", audioSubtitle: "", backgroundImageName: "boyDetail", duration: "01:51", audioName: "SleepBoy6", audioType: "mp3")]),
        
        Item(title: "Girl", audioCoverImage: "categoryGirl", audioPackageCount: "2", AudioPackageCoverImage: "categoryGirl", audioCategory: "Lullaby",songs: [
            Song(title: "Sleep Girl 1", audioSubtitle: "", backgroundImageName: "girlDetail", duration: "29:10", audioName: "SleepGirl1", audioType: "mp3"),
            Song(title: "Sleep Girl 2", audioSubtitle: "", backgroundImageName: "girlDetail", duration: "15:11", audioName: "SleepGirl2", audioType: "mp3"),
            Song(title: "Sleep Girl 3", audioSubtitle: "", backgroundImageName: "girlDetail", duration: "29:10", audioName: "SleepGirl3", audioType: "mp3"),
            Song(title: "Sleep Girl 4", audioSubtitle: "", backgroundImageName: "girlDetail", duration: "29:10", audioName: "SleepGirl4", audioType: "mp3"),
            Song(title: "Sleep Girl 5", audioSubtitle: "", backgroundImageName: "girlDetail", duration: "29:10", audioName: "SleepGirl5", audioType: "mp3"),
            Song(title: "Sleep Girl 6", audioSubtitle: "", backgroundImageName: "girlDetail", duration: "29:10", audioName: "SleepGirl6", audioType: "mp3")]),
        
        Item(title: "Classic Music", audioCoverImage: "categoryClassicmusic", audioPackageCount: "5", AudioPackageCoverImage: "categoryClassicmusic", audioCategory: "Lullaby",songs: [
            Song(title: "Für Elise", audioSubtitle: "Beethoven", backgroundImageName: "classicalmusicDetail1", duration: "02:47", audioName: "Beethoven-FurElise", audioType: "mp3"),
            Song(title: "Nocturne op.9 No.2", audioSubtitle: "Chopin", backgroundImageName: "classicalmusicDetail2", duration: "04:09", audioName: "Chopin-Nocturneop.9No.2", audioType: "mp3"),
            Song(title: "Peer gynt morning mood", audioSubtitle: "Edvard Grieg", backgroundImageName: "classicalmusicDetail3", duration: "03:52", audioName: "EdvardGrieg-Peer-gynt-morning-mood", audioType: "mp3"),
            Song(title: "The Four Seasons Winter", audioSubtitle: "Vivaldi", backgroundImageName: "classicalmusicDetail2", duration: "01:38", audioName: "Vivaldi-The-four-seasons-winter", audioType: "mp3"),
            Song(title: "Piano Sonata", audioSubtitle: "Mozart", backgroundImageName: "classicalmusicDetail1", duration: "01:26", audioName: "mozart-piano-Sonata", audioType: "mp3")]),
               
        Item(title: "Music Box", audioCoverImage: "categoryMusicbox", audioPackageCount: "1", AudioPackageCoverImage: "categoryMusicbox", audioCategory: "Lullaby",songs: [
            Song(title: "Music Box", audioSubtitle: "", backgroundImageName: "categoryMusicbox", duration: "02:50", audioName: "music_box_0", audioType: "mp3"),
            Song(title: "Music Box", audioSubtitle: "", backgroundImageName: "categoryMusicbox", duration: "01:16", audioName: "music_box_1", audioType: "mp3"),
            Song(title: "Music Box", audioSubtitle: "", backgroundImageName: "categoryMusicbox", duration: "00:14", audioName: "music_box_2", audioType: "wav"),
            Song(title: "Music Box", audioSubtitle: "", backgroundImageName: "categoryMusicbox", duration: "02:05", audioName: "music_box_3", audioType: "mp3"),
            Song(title: "Music Box", audioSubtitle: "", backgroundImageName: "categoryMusicbox", duration: "00:47", audioName: "music_box_4", audioType: "mp3"),
            Song(title: "Music Box", audioSubtitle: "", backgroundImageName: "categoryMusicbox", duration: "01:12", audioName: "music_box_5", audioType: "mp3"),
            Song(title: "Music Box", audioSubtitle: "", backgroundImageName: "categoryMusicbox", duration: "01:20", audioName: "music_box_6", audioType: "mp3"),
            Song(title: "Music Box", audioSubtitle: "", backgroundImageName: "categoryMusicbox", duration: "00:28", audioName: "music_box_7", audioType: "wav")]),
        
        Item(title: "Bird Songs", audioCoverImage: "birdSongs", audioPackageCount: "5", AudioPackageCoverImage: "categoryBird", audioCategory: "Lullaby",songs: [
            Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
            Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
            Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
            Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
            Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
            Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "00:36", audioName: "birdSound4", audioType: "mp3"),
            Song(title: "BirdSound 07", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "01:05", audioName: "birdSound4", audioType: "mp3")]),
        
        Item(title: "Womb", audioCoverImage: "categoryWhomb", audioPackageCount: "3", AudioPackageCoverImage: "categoryWhomb", audioCategory: "", songs: [
            Song(title: "Womb", audioSubtitle: "", backgroundImageName: "wombDetail", duration: "15:59", audioName: "womb", audioType: "mp3"),
            Song(title: "White Noise", audioSubtitle: "", backgroundImageName: "wombDetail", duration: "09:15", audioName: "whitenoise1", audioType: "mp3"),
            Song(title: "White Noise and Heartbeat", audioSubtitle: "", backgroundImageName: "wombDetail", duration: "08:34", audioName: "whitenoise2", audioType: "mp3"),]),
        
        Item(title: "Colic Music", audioCoverImage: "categoryColic", audioPackageCount: "1", AudioPackageCoverImage: "categoryColic", audioCategory: "Lullaby",songs: [
            Song(title: "Colic", audioSubtitle: "", backgroundImageName: "categoryColic", duration: "10:00", audioName: "kolicvacumm", audioType: "mp3")]),
       
        Item(title: "Hair Dryer", audioCoverImage: "categoryHairdryer", audioPackageCount: "1", AudioPackageCoverImage: "categoryHairdryer", audioCategory: "Lullaby",songs: [
            Song(title: "Hair Dryer", audioSubtitle: "", backgroundImageName: "hairdrierDetail", duration: "03:09", audioName: "hairdryer1", audioType: "mp3")]),
   
        Item(title: "Vacuum Cleaner", audioCoverImage: "categoryVacuumcleaner", audioPackageCount: "1", AudioPackageCoverImage: "categoryVacuumcleaner", audioCategory: "Lullaby",songs: [
            Song(title: "Vacuum(Colic)", audioSubtitle: "", backgroundImageName: "categoryVacuumcleaner", duration: "10:00", audioName: "kolicvacumm", audioType: "mp3")]),
        
        //Item(title: "Lullaby Islamic", audioCoverImage: "categoryIslamiclullaby", audioPackageCount: "0", AudioPackageCoverImage: "categoryIslamiclullaby", audioCategory: "Lullaby",songs: []),
        
        Item(title: "Happy Birthday", audioCoverImage: "categoryHappyBirthday", audioPackageCount: "1", AudioPackageCoverImage: "categoryHappyBirthday", audioCategory: "", songs: [
            Song(title: "Happy Birthday", audioSubtitle: "", backgroundImageName: "categoryHappyBirthday", duration: "01:04", audioName: "happybirthday", audioType: "mp3")]),
        
        Item(title: "Camp Fire", audioCoverImage: "categoryCampFire", audioPackageCount: "1", AudioPackageCoverImage: "categoryCampFire", audioCategory: "Lullaby", songs: [
            Song(title: "Camp Fire", audioSubtitle: "", backgroundImageName: "campfireDetail", duration: "02:46", audioName: "campfire1", audioType: "mp3")]),
        
        //Item(title: "Rain", audioCoverImage: "categoryRain", audioPackageCount: "1", AudioPackageCoverImage: "categoryRain", audioCategory: "Lullaby",songs: []),
        
        Item(title: "Water", audioCoverImage: "categoryWater", audioPackageCount: "1", AudioPackageCoverImage: "categoryWater", audioCategory: "Lullaby",songs: [
            Song(title: "Water Sound", audioSubtitle: "Naturel", backgroundImageName: "watersoundDetail1", duration: "05:00", audioName: "watersound1", audioType: "mp3")]),
        
        Item(title: "Wave", audioCoverImage: "categoryWave", audioPackageCount: "1", AudioPackageCoverImage: "categoryWave", audioCategory: "Lullaby",songs: [
            Song(title: "Wave", audioSubtitle: "Naturel", backgroundImageName: "categoryWave", duration: "07:06", audioName: "wave1", audioType: "mp3")]),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Singleton.sharedInstance.stop()
        setupView()
        setupCollectionView()
        Crashlytics.crashlytics().log("view loaded")
    }
    
    override func  viewWillAppear(_ animated: Bool) {
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    private func setupView(){
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .white
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 1
            let linespacing: CGFloat = 16
            let interItemSpacing: CGFloat = 5
            let itemW = (view.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow - 32
            let itemH = itemW
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: itemW, height: itemH)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = linespacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 12.0).cgPath
        
        if indexPath.item == 0 {
            cell.coverImageOverlay.alpha = 0.1
            cell.imageView.image = UIImage(named: items[indexPath.item].audioCoverImage)
            cell.isUserInteractionEnabled = true
            cell.audioPackageItemCountsLabel.text = nil
            cell.audioTitleLabel.text = nil
        } else {
            cell.isUserInteractionEnabled = true
            cell.imageView.image = UIImage(named: items[indexPath.item].audioCoverImage)
            cell.audioPackageItemCountsLabel.text = String(items[indexPath.item].songs.count) + " Sounds"
            cell.audioTitleLabel.text = items[indexPath.item].title
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
            showCategoriesAlert()
            print("You selected 0 item")
        } else {
            let item = items[indexPath.item]
            chosenLandmarkName = String("Sounds")
            chosenCategoriesLabel = items[indexPath.item].title
            choosenCategory = items[indexPath.item].audioCategory
            choosenSongs = items[indexPath.item].songs
            self.performSegue(withIdentifier: "viewImageSegueIdentifier", sender: item)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! Item
        if segue.identifier == viewImageSegueIdentifier{
            if let vc = segue.destination as? SoundsListDetailVC {
                vc.imageName = item.AudioPackageCoverImage
                vc.selectedLandmarkName = chosenLandmarkName
                vc.selectedCategoriesLabel = chosenCategoriesLabel
                vc.selectedCategorySongs = choosenSongs
            }
        }
    }
    
    @objc func backTapped() {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func showCategoriesAlert(){
        let alert = UIAlertController(title: String(NSLocalizedString("Hello", comment: "")), message: "Pls Check the categories.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
