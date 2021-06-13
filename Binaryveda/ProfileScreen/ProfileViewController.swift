//
//  ProfileViewController.swift
//  Binaryveda
//
//  Created by Rohit Sonawane on 12/06/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialisation()
     }
    
    func initialisation()
    {
     
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        
        collectionView.reloadData()
    }
    
    @IBAction func uploadClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
        
        cell.imgPics.image = UIImage(named: "image\(indexPath.row)")
        
        
        return cell;
        
    }
     
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 20
       }
 
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
        return CGSize(width: collectionView.frame.size.width / 2.1, height: collectionView.frame.size.width / 2.1)
       }
     
}
