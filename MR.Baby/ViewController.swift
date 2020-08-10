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
        Item(title: "Lullaby 1", audioCoverImage: "categoryLullaby1", audioPackageCount: "1", AudioPackageCoverImage: "categoryLullaby1", audioCategory: "Lullaby 1",songs: [
            Song(title: "Lullaby", audioSubtitle: "", backgroundImageName: "lullaby1Detail", duration: "15:00", audioName: "pedagog_ninni", audioType: "mp3")]),
        Item(title: "Lullaby 2", audioCoverImage: "categoryLullaby2", audioPackageCount: "1", AudioPackageCoverImage: "categoryLullaby2", audioCategory: "Lullaby 2",songs: [
            Song(title: "Dandini", audioSubtitle: "Anonim", backgroundImageName: "lullaby2Detail", duration: "08:24", audioName: "dandini", audioType: "mp3")]),
        Item(title: "Lullaby 3", audioCoverImage: "categoryLullaby3", audioPackageCount: "0", AudioPackageCoverImage: "categoryLullaby3", audioCategory: "", songs: []),
        Item(title: "Colic Music", audioCoverImage: "categoryColic", audioPackageCount: "1", AudioPackageCoverImage: "categoryColic", audioCategory: "Lullaby",songs: [
            Song(title: "Colic", audioSubtitle: "", backgroundImageName: "categoryColic", duration: "10:00", audioName: "kolicvacumm", audioType: "mp3")]),
        Item(title: "Womb", audioCoverImage: "categoryWhomb", audioPackageCount: "3", AudioPackageCoverImage: "categoryWhomb", audioCategory: "", songs: [
            Song(title: "Womb", audioSubtitle: "", backgroundImageName: "wombDetail", duration: "15:59", audioName: "womb", audioType: "mp3"),
            Song(title: "White Noise", audioSubtitle: "", backgroundImageName: "wombDetail", duration: "09:15", audioName: "whitenoise", audioType: "mp3"),
            Song(title: "White Noise and Heartbeat", audioSubtitle: "", backgroundImageName: "wombDetail", duration: "08:34", audioName: "whitenoise-and-heartbeat", audioType: "mp3"),]),
        Item(title: "Music Box", audioCoverImage: "categoryMusicbox", audioPackageCount: "1", AudioPackageCoverImage: "categoryMusicbox", audioCategory: "Lullaby",songs: [
            Song(title: "Music Box", audioSubtitle: "", backgroundImageName: "categoryMusicbox", duration: "02:50", audioName: "musicbox1", audioType: "mp3")]),
        Item(title: "Classic Music", audioCoverImage: "categoryClassicmusic", audioPackageCount: "5", AudioPackageCoverImage: "categoryClassicmusic", audioCategory: "Lullaby",songs: [
            Song(title: "Für Elise", audioSubtitle: "Beethoven", backgroundImageName: "classicalmusicDetail1", duration: "02:47", audioName: "Beethoven-FurElise", audioType: "mp3"),
            Song(title: "Nocturne op.9 No.2", audioSubtitle: "Chopin", backgroundImageName: "classicalmusicDetail2", duration: "04:09", audioName: "Chopin-Nocturneop.9No.2", audioType: "mp3"),
            Song(title: "Peer gynt morning mood", audioSubtitle: "Edvard Grieg", backgroundImageName: "classicalmusicDetail3", duration: "03:52", audioName: "EdvardGrieg-Peer-gynt-morning-mood", audioType: "mp3"),
            Song(title: "The Four Seasons Winter", audioSubtitle: "Vivaldi", backgroundImageName: "classicalmusicDetail2", duration: "01:38", audioName: "Vivaldi-The-four-seasons-winter", audioType: "mp3"),
            Song(title: "Piano Sonata", audioSubtitle: "Mozart", backgroundImageName: "classicalmusicDetail1", duration: "01:26", audioName: "mozart-piano-Sonata", audioType: "mp3")]),
        Item(title: "Hair Dryer", audioCoverImage: "categoryHairdryer", audioPackageCount: "1", AudioPackageCoverImage: "categoryHairdryer", audioCategory: "Lullaby",songs: [
            Song(title: "Hair Dryer", audioSubtitle: "", backgroundImageName: "hairdrierDetail", duration: "03:09", audioName: "hairdryer", audioType: "mp3")]),
        Item(title: "Vacuum Cleaner", audioCoverImage: "categoryVacuumcleaner", audioPackageCount: "1", AudioPackageCoverImage: "categoryVacuumcleaner", audioCategory: "Lullaby",songs: [
            Song(title: "Vacuum(Colic)", audioSubtitle: "", backgroundImageName: "categoryVacuumcleaner", duration: "10:00", audioName: "kolicvacumm", audioType: "mp3")]),
        Item(title: "Lullaby Islamic", audioCoverImage: "categoryIslamiclullaby", audioPackageCount: "0", AudioPackageCoverImage: "categoryIslamiclullaby", audioCategory: "Lullaby",songs: []),
        Item(title: "Happy Birthday", audioCoverImage: "categoryHappyBirthday", audioPackageCount: "0", AudioPackageCoverImage: "categoryHappyBirthday", audioCategory: "", songs: []),
        Item(title: "Bird Songs", audioCoverImage: "birdSongs", audioPackageCount: "5", AudioPackageCoverImage: "categoryBird", audioCategory: "Lullaby",songs: [
            Song(title: "BirdSound 01", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail1", duration: "05:30", audioName: "birdSound", audioType: "mp3"),
            Song(title: "BirdSound 02", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail2", duration: "02:28", audioName: "birdSound2", audioType: "mp3"),
            Song(title: "BirdSound 03", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail3", duration: "05:19", audioName: "birdSound3", audioType: "mp3"),
            Song(title: "BirdSound 04", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail4", duration: "04:14", audioName: "birdSound4", audioType: "mp3"),
            Song(title: "BirdSound 05", audioSubtitle: "Story Of Birds", backgroundImageName: "birdDetail5", duration: "05:05", audioName: "birdSound5", audioType: "mp3")]),
        Item(title: "Camp Fire", audioCoverImage: "categoryCampFire", audioPackageCount: "1", AudioPackageCoverImage: "categoryCampFire", audioCategory: "Lullaby", songs: [
            Song(title: "Camp Fire", audioSubtitle: "", backgroundImageName: "campfireDetail", duration: "02:46", audioName: "campfire", audioType: "mp3")]),
        Item(title: "Rain", audioCoverImage: "categoryRain", audioPackageCount: "1", AudioPackageCoverImage: "categoryRain", audioCategory: "Lullaby",songs: []),
        Item(title: "Water", audioCoverImage: "categoryWater", audioPackageCount: "1", AudioPackageCoverImage: "categoryWater", audioCategory: "Lullaby",songs: [
            Song(title: "Water Sound", audioSubtitle: "Naturel", backgroundImageName: "watersoundDetail1", duration: "05:00", audioName: "watersound", audioType: "mp3")]),
        Item(title: "Wave", audioCoverImage: "categoryWave", audioPackageCount: "1", AudioPackageCoverImage: "categoryWave", audioCategory: "Lullaby",songs: [
            Song(title: "Wave", audioSubtitle: "Naturel", backgroundImageName: "categoryWave", duration: "07:06", audioName: "wawe", audioType: "mp3")]),
        Item(title: "Boy", audioCoverImage: "categoryBoy", audioPackageCount: "0", AudioPackageCoverImage: "categoryBoy", audioCategory: "Lullaby",songs: []),
        Item(title: "Girl", audioCoverImage: "categoryGirl", audioPackageCount: "0", AudioPackageCoverImage: "categoryGirl", audioCategory: "Lullaby",songs: [])
        
                         ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupCollectionView()
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
//            let itemW = view.frame.width - 32

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
            cell.audioPackageItemCountsLabel.text = String(items[indexPath.item].audioPackageCount + " Sounds")
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
        //Mahmut buradaki metinleri düzenleyin
        let alert = UIAlertController(title: String(NSLocalizedString("Category_Alert_Title", comment: "")), message: "Lütfen aşağıdakilerden tekini seçip dinlemeye başla.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }

    
}

