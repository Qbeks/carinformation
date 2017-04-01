//
//  BrandsViewController.swift
//  CarInformation
//
//  Created by Kamil Kubis on 21.03.2017.
//  Copyright © 2017 MobiSoft. All rights reserved.
//

import UIKit

class BrandsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var brands = [
        ["name": "Audi", "img": ""]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let requestURL: NSURL = NSURL(string: "http://jakisadres.pl/get_brands")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as? [[String: AnyObject]]
                    
                    for brand in json! {
                        
                        let name = brand["name"] as? String
                        let img  = brand["img"] as? String
                        
                        let br = ["name" : name, "img": img]
                        self.brands.append(br as! [String : String])
                    }
                    
                    self.tableView.reloadData()
                } catch {
                    print("Error with Json: \(error)")
                }
                
            } else{
                print("UWAGA ERROR")
            }
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (brands.count)
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BrandTableViewCell
        
        cell.name.text = brands[indexPath.row]["name"]
        
        return (cell)
    }
    

    func downloadImage(urlToImage: String, imageView: UIImageView) {
        let catPictureURL = URL(string: urlToImage)!
        
        let session = URLSession(configuration: .default)
        
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        imageView.image = UIImage(data: imageData)
                        
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
        downloadPicTask.resume()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
