//
//  ViewController.swift
//  CoreDataToDoList
//
//  Created by aleksandar on 10.1.22..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var models = [ToDoListItem]()
    var item: ToDoListItem? {
        didSet {
            if let item = item {
                date = item.createdAt
            }
        }
    }
    
    var date = Date()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllItems()
        title = "Core Data To Do List"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Actions
    
    @IBAction func addButton() {
        let alert = UIAlertController(
            title: "New item",
            message: "Add new item",
            preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let alertAction = UIAlertAction(
            title: "Submit",
            style: .cancel,
            handler: { _ in
                guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                    return
                }
                self.createItem(name: text)
            })
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Methods
    
    func format(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    //MARK: - Core Data
    
    func getAllItems() {
        do {
            models = try context.fetch(ToDoListItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print(error)
        }
    }
    
    func createItem(name: String) {
        let newItem = ToDoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print(error)
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print(error)
        }
    }
    
    func updateItem(item: ToDoListItem, newName: String) {
        item.name = newName
        
        do {
            try context.save()
            getAllItems()
        } catch {
            print(error)
        }
    }
    
}

//MARK: - Table View Data Source & Delegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = format(date: date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = models[indexPath.row]
        let sheet = UIAlertController(
            title: "Edit item",
            message: nil,
            preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil)
        let editAction = UIAlertAction(
            title: "Edit",
            style: .default) { [weak self] _ in
                let alert = UIAlertController(
                    title: "Edit item",
                    message: "Edit your item",
                    preferredStyle: .alert)
                alert.addTextField(configurationHandler: nil)
                alert.textFields?.first?.text = item.name
                let alertAction = UIAlertAction(
                    title: "Submit",
                    style: .cancel,
                    handler: { _ in
                        guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                            return
                        }
                        self?.updateItem(item: item, newName: newName)
                    })
                alert.addAction(alertAction)
                self?.present(alert, animated: true, completion: nil)
            }
        let deleteAction = UIAlertAction(
            title: "Delete",
            style: .destructive) { [weak self] _ in
                self?.deleteItem(item: item)
            }
        sheet.addAction(cancelAction)
        sheet.addAction(editAction)
        sheet.addAction(deleteAction)
        present(sheet, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
