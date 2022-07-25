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
    
    @IBAction private func addNotePressed(_ sender: UIButton) {
        // ToDo
//        NetworkManager(url: URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/notes")!).addNote(note: note) { message in
//            print(message)
//            self.notes.append(note)
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
        let deleteAction = UIContextualAction(style: .normal, title: nil) { [weak self] (_, _, _) in
            
        }
        let editAction = UIContextualAction(style: .normal, title: nil) { [weak self] (_, _, _) in
            
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
