//
//  EditNoteVC.swift
//  basicnoteapp-EmirAlkal
//
//  Created by Emir Alkal on 27.07.2022.
//

import UIKit

class EditNoteVC: UIViewController {

    @IBOutlet weak private var noteTitle: UITextField!
    @IBOutlet weak private var noteContent: UITextView!
    
    let titleLabel = UITextField()
    let contentLabel = UITextView()
    let button = UIButton()

    var note: Note
    
    init(note: Note) {
        self.note = note
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBarBackButton()
        view.backgroundColor = .systemBackground
        configureLayout()
    }
}

// MARK: - Configurations

extension EditNoteVC {
    func configureNavBarBackButton() {
        navigationController?.navigationBar.backIndicatorImage = .init(named: "Path")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = .init(named: "Path")
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        title = "Edit Note"
    }
}

// MARK: Layout

extension EditNoteVC {
    func configureLayout() {
        configureLabels()
        configureButton()
    }
    
    func configureLabels() {
        titleLabel.text = note.title
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        
        contentLabel.text = note.note
        contentLabel.textColor = UIColor(named: "grey")
        contentLabel.font = .systemFont(ofSize: 17)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentLabel.heightAnchor.constraint(equalToConstant: 150)
        ])

    }
    
    func configureButton() {
        button.backgroundColor = UIColor(named: "purple")
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitle("Save Note", for: .normal)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            button.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 50),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    func buttonTapped() {
        guard let titleText = titleLabel.text, let contentText = contentLabel.text else { return }
        note.title = titleText
        note.note = contentText
        
        NetworkManager(url: URL(string: "https://basicnoteapp-emiralkal.herokuapp.com/api/notes/")!).editNote(id: note.id, note: note) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
