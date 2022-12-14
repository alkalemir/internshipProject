//
//  NotesVC.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 22.07.2022.
//

import UIKit

class NotesVC: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak private var addNoteButton: UIButton!
    @IBOutlet weak private var tableView: UITableView!
    
    var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        addNoteButton.setImage(.init(named: "plus_icon"), for: .normal)
        configureTableView()
        
        NetworkManager(url: URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/users/me/notes?page=1")!).getNotes { notes in
            self.notes = notes.data.data
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkManager(url: URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/users/me/notes?page=1")!).getNotes { notes in
            self.notes = notes.data.data
        }
    }
}

// MARK: - Configurations

extension NotesVC {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = 140
    }
}

// MARK: - TableView

extension NotesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell

        cell?.content.text = notes[indexPath.row].note
        cell?.title.text = notes[indexPath.row].title
        
        return cell ?? TableViewCell()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: nil) { (_, _, _) in
            let alertController = UIAlertController(title: "Delete Note",
                                                    message: "Are you sure you want to delete this note?", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
            alertController.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                NetworkManager(url: URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/notes/")!)
                    .deleteNote(id: self.notes[indexPath.row].id) {
                        self.notes.remove(at: indexPath.row)
                    }
            }))
            self.present(alertController, animated: true)
        }
        
        let editAction = UIContextualAction(style: .normal, title: nil) { (_, _, _) in
            self.navigationController?.pushViewController(EditNoteVC(note: self.notes[indexPath.row]), animated: true)
        }
        deleteAction.backgroundColor = UIColor(named: "red")
        editAction.backgroundColor = UIColor(named: "editNote")
        
        deleteAction.image = .init(named: "delete")
        editAction.image = .init(named: "edit")
        
        let actions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        actions.performsFirstActionWithFullSwipe = false
        
        return actions
    }
}
