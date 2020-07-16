//
//  ViewController.swift
//  MR.Baby
//
//  Created by İlker isa Mercan on 4.07.2020.
//  Copyright © 2020 Mahmut Mercan. All rights reserved.
//

import UIKit

struct Item {
    var title: String
    var audioTitle: String
    var duration: String
    var audioCoverImage: String
    var audioPackageCount: String
    var AudioPackageCoverImage: String
    var audioCategory: String
    var songs: [Song]
}

//enum catogryType {
//    case Inna
//    case Rihanna
//    case Tarkan
//}



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
        Item(title: "Lullaby 1", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryLullaby1", audioPackageCount: "26", AudioPackageCoverImage: "categoryLullaby1", audioCategory: "birdSongs",songs: []),
        Item(title: "Lullaby 2", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryLullaby2", audioPackageCount: "6", AudioPackageCoverImage: "categoryLullaby2", audioCategory: "Lullaby",songs: [
            Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3", audioPosition: 1),
            Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3", audioPosition: 2),
        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3", audioPosition: 3),
        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3", audioPosition: 4),
        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3", audioPosition: 5),
        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3", audioPosition: 6)]),
//        Item(title: "Music Box", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryMusicbox", audioPackageCount: "12", AudioPackageCoverImage: "categoryMusicbox", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3", audioPosition: 1),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Classic Music", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryClassicmusic", audioPackageCount: "67", AudioPackageCoverImage: "categoryClassicmusic", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Colic Music", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryColic", audioPackageCount: "32", AudioPackageCoverImage: "categoryColic", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Bird Songs", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryBird", audioPackageCount: "67", AudioPackageCoverImage: "categoryBird", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Boy", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryBoy", audioPackageCount: "67", AudioPackageCoverImage: "categoryBoy", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Girl", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryGirl", audioPackageCount: "67", AudioPackageCoverImage: "categoryGirl", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Islamic Lullaby", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryIslamiclullaby", audioPackageCount: "67", AudioPackageCoverImage: "categoryIslamiclullaby", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Hair Dryer", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryHairdryer", audioPackageCount: "67", AudioPackageCoverImage: "categoryHairdryer", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Vacuum Cleaner", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryVacuumcleaner", audioPackageCount: "67", AudioPackageCoverImage: "categoryVacuumcleaner", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Rain", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryRain", audioPackageCount: "67", AudioPackageCoverImage: "categoryRain", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
//        Item(title: "Water", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryWater", audioPackageCount: "67", AudioPackageCoverImage: "categoryWater", audioCategory: "Lullaby",songs: [
//        Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
//        Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
//        Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
//        Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
//        Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3"),
//        Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3")]),
        Item(title: "Wave", audioTitle: "audio title", duration: "03:00", audioCoverImage: "categoryWave", audioPackageCount: "67", AudioPackageCoverImage: "categoryWave", audioCategory: "Lullaby",songs: [
            Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3", audioPosition: 1),
            Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3", audioPosition: 2),
            Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3", audioPosition: 3),
            Song(title: "BirdSound 06", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "14:32", audioName: "birdSound", audioType: "mp3", audioPosition: 4)])
                         ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        setupCollectionView()
    }

    override func  viewWillAppear(_ animated: Bool) {
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }
    
    private func setupCollectionView() {
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
            let width = (collectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
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
        
        cell.imageView.image = UIImage(named: items[indexPath.item].audioCoverImage)
        cell.audioPackageItemCountsLabel.text = String(items[indexPath.item].audioPackageCount + " Sounds")
        cell.audioTitleLabel.text = items[indexPath.item].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.item]
        
        chosenLandmarkName = String("Sounds")
        chosenCategoriesLabel = items[indexPath.item].title
        choosenCategory = items[indexPath.item].audioCategory
        choosenSongs = items[indexPath.item].songs
        
        self.performSegue(withIdentifier: "viewImageSegueIdentifier", sender: item)
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! Item
        if segue.identifier == viewImageSegueIdentifier{

            if let vc = segue.destination as? ImageViewerViewController {

                vc.imageName = item.AudioPackageCoverImage
                vc.selectedLandmarkName = chosenLandmarkName
                vc.selectedCategoriesLabel = chosenCategoriesLabel
//                vc.selectedCategory = choosenCategory
                vc.selectedCategorySongs = choosenSongs

            }
        }
    }
    
    @objc func backTapped() {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }



    
    
}

