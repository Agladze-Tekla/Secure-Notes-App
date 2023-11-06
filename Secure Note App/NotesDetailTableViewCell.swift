//
//  NotesDetailTableViewCell.swift
//  Secure Note App
//
//  Created by Tekla on 11/5/23.
//

import UIKit

final class NotesDetailTableViewCell: UITableViewCell {

    // MARK: - Properties
    private let noteStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        //stackView.isLayoutMarginsRelativeArrangement = true
        //stackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let noteNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        noteLabel.text = nil
        noteNameLabel.text = nil
    }
    
    // MARK: - Configure
    func configure(model: NoteDetails) {
        noteLabel.text = model.note
        noteNameLabel.text = model.title
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        addSubview(noteStackView)
        noteStackView.addArrangedSubview(noteNameLabel)
        noteStackView.addArrangedSubview(noteLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            noteStackView.topAnchor.constraint(equalTo: self.topAnchor),
            noteStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            noteStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            noteStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
