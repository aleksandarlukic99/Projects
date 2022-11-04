//
//  ViewController.swift
//  SearchPhoto
//
//  Created by aleksandar on 28.12.21..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var results: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionViewCell.nib(), forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width / 3, height: view.frame.size.width / 3)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        collectionView.collectionViewLayout = layout
    }
    
    //MARK: - Methods
    
    func fetchPhotos(query: String) {
        let stringURL = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(query)&client_id=I6E5W0T3_CwPyURrx-zKsSztZ-jOPTrPZ2Vcfs_5uEQ"
        guard let url = URL(string: stringURL) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.results = jsonResult.results
                    self.collectionView.reloadData()
                }
            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.noResultsAction()
                }
            }
        }
        task.resume()
    }
    
    func noResultsAction() {
        let alert = UIAlertController(title: "No results", message: "Sorry, we have no images for searched term.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FullImage" {
            let fullImageVC = segue.destination as! FullImageViewController
            let indexPath = sender as! IndexPath
            let fullImageResult = results[indexPath.row]
            fullImageVC.results = fullImageResult
        }
    }
}


//MARK: - Delegates
extension ViewController: UICollectionViewDelegate {
 
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results[indexPath.row].urls.regular
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.configure(with: imageURLString)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: "FullImage", sender: indexPath)
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            results = []
            collectionView.reloadData()
            fetchPhotos(query: text)
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width / 3) - 3, height: (view.frame.size.width / 3) - 3)
    }
}
