//
//  ViewController.swift
//  Lelap
//
//  Created by Dion Lamilga on 28/04/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var songs = [Song]()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "BG")
        iv.contentMode = .scaleAspectFill
        iv.alpha = 0.8
        return iv
    }()
    
   
    

    @IBOutlet weak var collectionSong: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionSong.delegate = self
        collectionSong.dataSource = self
        collectionSong.backgroundView = imageView
        
        tabBarItem.title = "Home"
        configureSong()
        // Do any additional setup after loading the view.
    }
    
    func configureSong(){
        songs.append(Song(title: "Sea Wave",
                          penyanyi: "Queit Music",
                          image: "WaveImg",
                          track: "SeaWave"))
        
        songs.append(Song(title: "Rain",
                          penyanyi: "Relaxing & Sleep Sounds",
                          image: "RainImg",
                          track: "Rain"))
        
        songs.append(Song(title: "Forest",
                          penyanyi: "Burgh Record",
                          image: "ForestImg",
                          track: "Forest"))
        
        songs.append(Song(title: "River",
                          penyanyi: "Escape Room Soundtrack",
                          image: "RiverImg",
                          track: "River"))
        
        songs.append(Song(title: "Waterfall",
                          penyanyi: "Relax Lane",
                          image: "WaterfallImg",
                          track: "Waterfall"))
        
        songs.append(Song(title: "Fluet",
                          penyanyi: "Xemox",
                          image: "FluetImg",
                          track: "Fluet"))
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CellSong", for: indexPath) as? ItemCell
        let song = songs[indexPath.row]

        let imageViewCell: UIImageView = {
           let iv = UIImageView()
            iv.image = UIImage(named: song.image)
            iv.contentMode = .scaleAspectFill
            return iv
        }()
        
        cell?.layer.cornerRadius = 20
        cell?.viewLbl.backgroundColor = UIColor(white: 1, alpha: 0.3)
        cell?.backgroundView = imageViewCell
        cell?.title.text = song.title
        cell?.subTitle.text = song.penyanyi
        
        return cell!
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let potition = indexPath.row


        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        
        vc.songs = songs
        vc.potition = potition
        

        present(vc, animated: true)

    }
    

}

struct Song {
    let title: String
    let penyanyi: String
    let image: String
    let track: String
}

