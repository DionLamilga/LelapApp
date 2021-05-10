//
//  PlayerViewController.swift
//  Lelap
//
//  Created by Dion Lamilga on 30/04/21.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    public var potition: Int = 0
    public var songs: [Song] = []
    
    var player: AVAudioPlayer?
    
    var timer:Timer!
    // User Interface element
    let slider = UISlider(frame: CGRect(x: 20, y: 600, width: 350, height: 50))
    
    private let songImangeView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let songName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let artisName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let playPauseBtn = UIButton()
    
    let startLbl = UILabel()
    
    let finishLbl = UILabel()
    
    @IBOutlet weak var holder: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      // var time = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    override func viewDidLayoutSubviews() {
        if holder.subviews.count == 0{
            configure()
        }
    }
    
    func configure()
    {
        let song = songs[potition]
        
        let urlString = Bundle.main.path(forResource: song.track, ofType: "mp3")
        
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else{
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            
            //player.play()
        }
        catch{
            print("error")
        }
        
        songImangeView.frame = CGRect(x: 140,
                                      y: 60,
                                      width: 110,
                                      height: 200)
        
        songImangeView.image = UIImage(named: song.image)
        holder.addSubview(songImangeView)
        
        
        
        //label
        
        songName.frame = CGRect(x: 10,
                                y: 300,
                                      width: holder.frame.size.width-20,
                                      height: 70)
        
        artisName.frame = CGRect(x: 10,
                                      y: 190,
                                      width: holder.frame.size.width-20,
                                      height: holder.frame.size.width-20)
        
        songName.text = song.title
        songName.font = UIFont(name: songName.font.fontName, size: 30)
        
        artisName.text = song.penyanyi
        artisName.font = UIFont(name: artisName.font.fontName, size: 20)
        artisName.textColor = #colorLiteral(red: 0.7686426044, green: 0.768547833, blue: 0.7771517038, alpha: 1)
        
        holder.addSubview(songName)
        holder.addSubview(artisName)
        
        
        // slider
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
        
        // player control
        
        //label waktu
        if let durasi = player?.duration{
            let second = TimeInterval(durasi)
            
            let secondText = String(format: "%02d",Int(second) % 60)
            let minuteText = String(format: "%02d",Int(second) / 60)
            
            finishLbl.text = "\(minuteText):\(secondText)"
        }
        

        startLbl.frame = CGRect(x: 25, y: 660, width: 70, height: 15)
        startLbl.text = "00:00"
        holder.addSubview(startLbl)
        
        finishLbl.frame = CGRect(x: 320, y: 660, width: 70, height: 15)
        holder.addSubview(finishLbl)
        
        //frame
        let size: CGFloat = 50
        
        playPauseBtn.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
                                    y: 500,
                                    width: size,
                                    height: size)
        
        // add action
        playPauseBtn.addTarget(self, action: #selector(didTapPauseBtn), for: .touchUpInside)
        
        playPauseBtn.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        
        playPauseBtn.tintColor = .black
        
        holder.addSubview(playPauseBtn)
    }
    
    @objc func didSlideSlider(_ slider: UISlider){
        guard let player = player else { return }
        player.stop()
        player.currentTime = TimeInterval(slider.value)
        //slider.value = Float(player.currentTime)
        player.prepareToPlay()
        player.play()
       // slider.value = Float(player!.currentTime)
    }
    
    @objc func updateSlider(){
        slider.value = Float(player!.currentTime)
    }
    
    @objc func didTapPauseBtn(){
        if player?.isPlaying == true{
            //pause
            player?.pause()
            playPauseBtn.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
            let session = AVAudioSession.sharedInstance()
            
            do{
                try session.setCategory(AVAudioSession.Category.playback)
            }catch{
                
            }
            
        }else{
            //play
            player?.play()
            playPauseBtn.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            var time = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
            guard let player = player else { return }
            slider.maximumValue = Float(player.duration)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateTime(){
        let curTime = Int(player!.currentTime)
        let secondText = String(format: "%02d",Int(curTime) % 60)
        let minuteText = String(format: "%02d",Int(curTime) / 60)
        
        startLbl.text = "\(minuteText):\(secondText)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
}
