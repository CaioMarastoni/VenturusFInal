//
//  ViewController.swift
//  DevVentureFinal
//
//  Created by Caio  Marastoni on 11/06/20.
//  Copyright © 2020 DevVenture. All rights reserved.
//

import UIKit


struct DataCats: Codable {
    let data: [Cats]
    
    init(cats: DataCats) {
        self.data = cats.data
    }
}

struct Cats: Codable {
    var images: [Images]
    var title: String
}

struct Images: Codable {
    let type: String
    let link: String
    
}

class ViewController: UIViewController {
    
    
    var arrayLinks: [String] = []
    var items: [String] = ["gato01", "gato02", "gato03", "gato04", "gato05", "gato06", "gato07", "gato08", "gato09", "gato10", "gato02", "gato03", "gato04", "gato05", "gato06", "gato07", "gato06", "gato07", "gato08", "gato09", "gato10", "gato02", "gato03", "gato04", "gato05", "gato06", "gato07"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        fetchJSON()
        
    }
    
    
    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        
        let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = .white
        view.addSubview(collection)
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
    }
    
    func fetchJSON() {
        
        let url = URL(string: "https://api.imgur.com/3/gallery/search/?q=cats")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.setValue("Client-ID 1ceddedc03a5d71", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            let parseCats = try? JSONDecoder().decode(DataCats.self, from: data!)
            if let parseCats = parseCats {
                
                //print(parseCats.data[0].images[0].link)
                parseCats.data.forEach({
                    print($0.title)
                    $0.images.forEach({
                        self.arrayLinks.append($0.link)
                        print(self.arrayLinks.count)
                        print($0.link)
                        
                    })
                })
                
            }
            
        }
        task.resume()
    }
    
}









