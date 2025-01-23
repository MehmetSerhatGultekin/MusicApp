//
//  ViewController.swift
//  MusicApp
//
//  Created by Mehmet Serhat Gültekin on 22.01.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var songs = [Song] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    
    func configureSongs() {
        songs.append(Song(name: "Blood Theme",
                          albumName: "Dexter",
                          artistName: "Show",
                          imageName: "cover1",
                          trackName: "song1"))
        
        songs.append(Song(name: "NKBİ",
                          albumName: "Video",
                          artistName: "Güneş",
                          imageName: "cover2",
                          trackName: "song2"))
        
        songs.append(Song(name: "Falling Down",
                          albumName: "jinji",
                          artistName: "lil peep & xxxtentaction",
                          imageName: "cover3",
                          trackName: "song3"))
        
        songs.append(Song(name: "Blood Theme",
                          albumName: "Dexter",
                          artistName: "Show",
                          imageName: "cover1",
                          trackName: "song1"))
        
        songs.append(Song(name: "NKBİ",
                          albumName: "Video",
                          artistName: "Güneş",
                          imageName: "cover2",
                          trackName: "song2"))
        
        songs.append(Song(name: "Falling Down",
                          albumName: "jinji",
                          artistName: "lil peep & xxxtentaction",
                          imageName: "cover3",
                          trackName: "song3"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell .detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator // açıklama göstergesi eklemek için kullanıldı
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Calibri-Bold", size: 18)
        cell.textLabel?.font = UIFont(name: "Calibri", size: 16)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // row boyutu
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerVC else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
    
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
