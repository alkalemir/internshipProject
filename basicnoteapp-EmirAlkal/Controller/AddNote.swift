//
//  EditNoteVC.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 27.07.2022.
//

import UIKit

class AddNote: UIViewController {

    @IBOutlet weak private var noteTitle: UITextField!
    @IBOutlet weak private var noteContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBarBackButton()
    }
    
    @IBAction private func addNotePressed(_ sender: UIButton) {
        guard let titleText = noteTitle.text, let contentText = noteContent.text else { return }
        
        let note = Note(id: -1, title: titleText, note: contentText)
        
        NetworkManager(url: URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/notes")!).addNote(note: note) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

// MARK: - Configurations
extension AddNote {
    func configureNavBarBackButton() {
        navigationController?.navigationBar.backIndicatorImage = .init(named: "Path")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = .init(named: "Path")
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        title = "Add Note"
    }
}
