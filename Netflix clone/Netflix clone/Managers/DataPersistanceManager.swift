//
//  DataPersistanceManager.swift
//  Netflix clone
//
//  Created by aleksandar on 5.11.22..
//

import Foundation
import UIKit
import CoreData

class DataPersistanceManager {
    
    enum DatabaseError: Error {
        case failedToSaveData
        case failToFetchData
    }
    
    static let shared = DataPersistanceManager()
    
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = ItemTitle(context: context)
        
        item.original_title = model.original_title
        item.original_name = model.original_name
        item.overview = model.overview
        item.poster_path = model.poster_path
        item.id = Int64(model.id)
        item.media_type = model.media_type
        item.release_date = model.release_date
        item.vote_average = model.vote_average
        item.vote_count = Int64(model.vote_count)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print(error.localizedDescription)
            completion(.failure(DatabaseError.failedToSaveData))
        }
        
    }
    
    func fetchTitlesFromDatabase(comletion: @escaping (Result<[ItemTitle], Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<ItemTitle>
        
        request = ItemTitle.fetchRequest()
        
        do {
           let titles =  try context.fetch(request)
            comletion(.success(titles))
        } catch {
            comletion(.failure(DatabaseError.failToFetchData))
        }
        
    }
    
    func deleteTitleWith(model: ItemTitle, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }
    }
}
