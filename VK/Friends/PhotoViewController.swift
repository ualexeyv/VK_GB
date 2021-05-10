//
//  PhotoViewController.swift
//  VK
//
//  Created by пользовтель on 10.03.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    private let VKServ = VKService()
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    var photoArray = [UIImage]()
    var selectedItem: Int = 0
    var userId: Int = 0
    
    var photosAF: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async { [weak self] in
            self?.VKServ.loadPhotoData(ownerId: self!.userId) { [weak self] arrayPhoto in
                self?.photosAF = arrayPhoto
                self?.collectionView.reloadData()
            }
        }
    }
    
}
extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   //     photoArray.count
        photosAF.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
   //     let photo = photoArray[indexPath.item]
        let photo = photosAF[indexPath.item].url
        
        let url = URL(string: photo)
        let image = convertUrlToImage(url: url!)
        photoArray.append (image!)
        cell.image.image = image
           
        
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = .zero
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = UIScreen.main.bounds.width
            let itemSize = (screenWidth / 3) - 10

            return CGSize(width: itemSize, height: itemSize)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = indexPath.item
        
        self.performSegue(withIdentifier: "detailPhoto", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailPhoto",
           let dest = segue.destination as? DetailPhotoViewController {
            dest.selectedItem = selectedItem
            dest.photos = photoArray
        }
    }
}
