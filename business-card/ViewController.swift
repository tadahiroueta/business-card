//
//  ViewController.swift
//  business-card
//
//  Created by Ueta, Lucas T on 10/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    let showMore = UIButton(),
        contactPills = UIStackView(),
        image = UIImage(named: "me.png")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        
//        whole view stack
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        
//        picture
        let picture = UIImageView(image: image)
        picture.layer.borderWidth = 2
        picture.layer.borderColor = UIColor.white.cgColor
        picture.layer.cornerRadius = 100
        picture.contentMode = .scaleAspectFill
        
        picture.layer.masksToBounds = false
        picture.clipsToBounds = true
        picture.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(picture)
        NSLayoutConstraint.activate([
            picture.widthAnchor.constraint(equalToConstant: 200),
            picture.heightAnchor.constraint(equalToConstant: 200)
        ])
        
//        text
        let text = UIStackView()
        text.axis = .vertical
        text.alignment = .center
        
        text.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(text)
        
//        header
        let header = UIStackView()
        header.axis = .vertical
        header.alignment = .center
        header.spacing = 12
        
        header.translatesAutoresizingMaskIntoConstraints = false
        text.addArrangedSubview(header)
        
//        name
        let name = UILabel()
        name.textColor = .white
        name.font = UIFont(name: "Helvetica", size: 36)
        name.text = "Lucas Ueta"

        header.addArrangedSubview(name)
        
//        title
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont(name: "Helvetica", size: 12)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.text = "Student at Centennial High School\n& Lab Instructor at iCode"
        
        header.addArrangedSubview(title)
        
//        contact information
        let contact = UIStackView()
        contact.axis = .vertical
        contact.alignment = .center
        contact.spacing = 8
        
        stack.addArrangedSubview(contact)
        
        showMore.setTitleColor(.white, for: .normal)
        showMore.titleLabel?.font = UIFont(name: "Helvetica", size: 12)
        showMore.setTitle("show more", for: .normal)
        showMore.addTarget(self, action: #selector(self.show(_:)), for: .touchUpInside)
        
        contact.addArrangedSubview(showMore)
        
//        contact pills (number and email)
        contactPills.axis = .vertical
        contactPills.alignment = .center
        contactPills.spacing = 10
        
        contact.addArrangedSubview(contactPills)
        
//        number
        let number = UILabel()
        number.textColor = .white
        number.font = UIFont(name: "Helvetica", size: 12)
        number.textAlignment = .center
        number.text = "469.927.2525"
        
        addPill(number, to: contactPills)
        
//        email
        let email = UILabel()
        email.textColor = .white
        email.font = UIFont(name: "Helvetica", size: 12)
        email.textAlignment = .center
        email.text = "tadahiroueta@gmail.com"
        
        addPill(email, to: contactPills)
        
//        toolbar
        let toolbar = UIToolbar()
        toolbar.setItems([
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        ], animated: false)

        toolbar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolbar)
        let guide = self.view.safeAreaLayoutGuide
        // denying the constraint errors
        UserDefaults.standard.setValue(false, forKey:"_UIConstraintBasedLayoutLogUnsatisfiable")
        NSLayoutConstraint.activate([
            toolbar.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            toolbar.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            toolbar.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            toolbar.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func addPill(_ label: UILabel, to parent: UIStackView) {
        let pill = UIStackView()
        pill.alignment = .center
        pill.layer.borderWidth = 1
        pill.layer.borderColor = UIColor.white.cgColor
        pill.layer.cornerRadius = 12.5
        
        pill.translatesAutoresizingMaskIntoConstraints = false
        parent.addArrangedSubview(pill)
        NSLayoutConstraint.activate([
            pill.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            pill.heightAnchor.constraint(equalToConstant: 25)
        ])
        pill.addArrangedSubview(label)
    }
    
    @objc func show(_ sender: UIButton) {
        showMore.setTitle(showMore.currentTitle == "show more" ? "show less" : "show more", for: .normal)
        contactPills.isHidden = !contactPills.isHidden
    }

    @objc func share() {
        present(UIActivityViewController(activityItems: [
            image!,
            "Lucas Ueta",
            "Student at Centennial High School & Lab Instructor at iCode",
            "469.927.2525",
            "tadahiroueta@gmail.com"
        ], applicationActivities: []), animated: true)
    }
}
