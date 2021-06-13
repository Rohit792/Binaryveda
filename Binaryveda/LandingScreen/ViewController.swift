//
//  ViewController.swift
//  Binaryveda
//
//  Created by Rohit Sonawane on 12/06/21.
//

import UIKit




class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var vcHeader: UIView!
    
    @IBOutlet weak var vcFooter: UIView!
    
    var arrayData : [landingModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialisation()
    }
    
    func initialisation() {
        tableView.register(UINib(nibName: "LandingTableViewCell", bundle: nil), forCellReuseIdentifier: "LandingTableViewCell")
        
        tableView.tableHeaderView = vcHeader
        tableView.tableFooterView = vcFooter
        
        
        loadJson(filename: "Landing")
         
    }
    
    func loadJson(filename fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([landingModel].self, from: data)
                self.arrayData = jsonData
                self.tableView.reloadData()
                
            } catch {
                print("error:\(error)")
            }
        }
     }
    
    @IBAction func newxClicked(_ sender: Any)
    {
       
    }

    @IBAction func registerClicked(_ sender: Any)
    {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let popupVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
         
        self.navigationController?.pushViewController(popupVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : LandingTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "LandingTableViewCell", for: indexPath) as? LandingTableViewCell
        
        cell.lblTitle.text = arrayData[indexPath.row].title
        cell.lblDescription.text = arrayData[indexPath.row].description

        cell.imgLogo.image = UIImage(named: arrayData[indexPath.row].image) 

        return cell
    }
    
    
    
}
