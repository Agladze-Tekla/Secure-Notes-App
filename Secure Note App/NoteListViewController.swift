//
//  NoteListViewController.swift
//  Secure Note App
//
//  Created by Tekla on 11/5/23.
//

import UIKit

final class NoteListViewController: UIViewController {
    
    //MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var notes = NoteDetails.noteList
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Private Methods
    private func setupView() {
        setupNavigationBar()
        setupBackground()
        setupSubviews()
        setupConstraints()
        setupTableView()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemIndigo
    }
    
    private func setupNavigationBar() {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(setupAddButtonAction)
        )
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    @objc private func setupAddButtonAction() {
        let addNoteViewController = AddNoteViewController()
        navigationController?.pushViewController(addNoteViewController, animated: true)
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NotesDetailTableViewCell.self, forCellReuseIdentifier: "noteDetailsCell")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - TableVIew DataSource
extension NoteListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "noteDetailsCell") as? NotesDetailTableViewCell {
            cell.configure(model: note)
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - TableVIew Delegate
extension NoteListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteDetailsViewController = NoteDetailsViewController()
        noteDetailsViewController.configure(model: notes[indexPath.row])
        navigationController?.pushViewController(noteDetailsViewController, animated: true)
    }
}

// MARK: - AddNewItemDelegate
extension NoteListViewController: AddNewNoteDelegate {
    func addNewNote(item: NoteDetails) {
        notes.append(item)
        tableView.reloadData()
    }
}

