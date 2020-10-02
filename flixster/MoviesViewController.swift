//
//  UsersViewController.swift
//  flixster
//
//  Created by Maggie Xiao on 09/25/2020.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource,
                            UITableViewDelegate{

    // arrays of dictionaries
    var movies = [[String : Any]]()

    @IBOutlet weak var moviesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
       
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { [self] (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
              
              movies = dataDictionary["results"] as! [[String:Any]] //casting
              moviesTableView.reloadData() // tell the TableView to update
              
            print(dataDictionary)
            
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row] // access the movies by index
        let title = movie["title"] as! String // cast type to String
        let synopsis = movie["overview"] as! String
        
        // access outlet and configure its text
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        
        // for fetching images from the API, get 185 pixel wide images
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        // pull in 3rd party library (CocoaPods) for downloading images
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        return cell
    }
    

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("Loading up the details screen")
        
        // Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = moviesTableView.indexPath(for:cell)!
        let movie = movies[indexPath.row]
        
        // Pass the selected movie to the details view controller
        let detailsViewController = (segue.destination as! MovieDetailsViewController) 
        detailsViewController.movie = movie
        
        moviesTableView.deselectRow(at: indexPath, animated: true)
    }

}
