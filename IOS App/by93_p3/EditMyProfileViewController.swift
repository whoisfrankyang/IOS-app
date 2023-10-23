//
//  EditMyProfileViewController.swift
//  Demo 2
//
//  Created by Frank Yang on 3/13/23.
//

import UIKit

class EditMyProfileViewController: UIViewController, UITextFieldDelegate{
    let saveButton = UIButton()
    let editMyProfileLabel = UILabel()
    let nameProfileLabel = UILabel()
    let portfolioProfileLabel = UILabel()
    let yearProfileLabel = UILabel()
    let aboutProfileLabel = UILabel()
    let backButton = UIButton()
    
    let nameTextField = UITextField()
    let portfolioTextField = UITextField()
    let yearTextField = UITextField()
    let aboutTextField = UITextField()
    
    var profileInfo: ProfileInfo?
    weak var delegate: ChangeImageDelegate?
    
    init(profileInfo: ProfileInfo, delegate: ChangeImageDelegate){
        self.profileInfo = profileInfo
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        saveButton.setTitle("Save", for:.normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 5
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addTarget(self, action: #selector(update),for:.touchUpInside)
        view.addSubview(saveButton)
        
        backButton.setTitle("Back", for:.normal)
        backButton.backgroundColor = .systemBlue
        backButton.layer.cornerRadius = 5
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(update),for:.touchUpInside)
        view.addSubview(backButton)
        
        nameProfileLabel.text = "Name"
        nameProfileLabel.font = .systemFont(ofSize: 15)
        nameProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameProfileLabel)
        
        portfolioProfileLabel.text = "Portfolio"
        portfolioProfileLabel.font = .systemFont(ofSize: 15)
        portfolioProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(portfolioProfileLabel)
        
        yearProfileLabel.text = "Year"
        yearProfileLabel.font = .systemFont(ofSize: 15)
        yearProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearProfileLabel)
        
        aboutProfileLabel.text = "About"
        aboutProfileLabel.font = .systemFont(ofSize: 15)
        aboutProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutProfileLabel)
        
        editMyProfileLabel.text = "Edit My Profile"
        editMyProfileLabel.font = .systemFont(ofSize: 20)
        editMyProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editMyProfileLabel)
        
        view.addSubview(nameTextField)
        nameTextField.placeholder = "Input your name"
        nameTextField.font = .systemFont(ofSize: 15)
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.delegate = self
        
        view.addSubview(portfolioTextField)
        portfolioTextField.placeholder = "Input your portfolio"
        portfolioTextField.font = .systemFont(ofSize: 15)
        portfolioTextField.borderStyle = .roundedRect
        portfolioTextField.translatesAutoresizingMaskIntoConstraints = false
        portfolioTextField.delegate = self
        
        view.addSubview(yearTextField)
        yearTextField.placeholder = "Input your year"
        yearTextField.font = .systemFont(ofSize: 15)
        yearTextField.borderStyle = .roundedRect
        yearTextField.translatesAutoresizingMaskIntoConstraints = false
        yearTextField.delegate = self
        
        view.addSubview(aboutTextField)
        aboutTextField.placeholder = "Input Something about you"
        aboutTextField.font = .systemFont(ofSize: 15)
        aboutTextField.borderStyle = .roundedRect
        aboutTextField.translatesAutoresizingMaskIntoConstraints = false
        aboutTextField.delegate = self
        
        
        setupConstraints()
        
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-10),
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant:10)
        ])
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant:10)
        ])
        
        
        NSLayoutConstraint.activate([
            editMyProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editMyProfileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant:10)
        ])

        
        NSLayoutConstraint.activate([
            nameProfileLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant:-100),
            nameProfileLabel.topAnchor.constraint(equalTo: editMyProfileLabel.topAnchor, constant:100)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant:-100),
            nameTextField.topAnchor.constraint(equalTo: nameProfileLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            portfolioProfileLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant:-100),
            portfolioProfileLabel.topAnchor.constraint(equalTo: nameProfileLabel.bottomAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            portfolioTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant:-100),
            portfolioTextField.topAnchor.constraint(equalTo: portfolioProfileLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            yearProfileLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant:-100),
            yearProfileLabel.topAnchor.constraint(equalTo: portfolioProfileLabel.bottomAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            yearTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant:-100),
            yearTextField.topAnchor.constraint(equalTo: yearProfileLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            aboutProfileLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant:-100),
            aboutProfileLabel.topAnchor.constraint(equalTo: yearProfileLabel.bottomAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            aboutTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor,constant:-100),
            aboutTextField.topAnchor.constraint(equalTo: aboutProfileLabel.bottomAnchor)
        ])
        
        
        
        
    }
    
    
    @objc func backToHomeView(){
        present(ViewController(), animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func update() {
        if let name = nameTextField.text{
            delegate?.changeName(name: name)
        }
        
        if let portfolio = portfolioTextField.text{
            delegate?.changePortfolio(portfolio: portfolio)
        }
        
        if let year = yearTextField.text{
            delegate?.changeYear(year: year)
        }
        
        if let about = aboutTextField.text{
            delegate?.changeAbout(about: about)
        }
        
    }
    

    
    
    
}

protocol ChangeProfileDelegate: ViewController{
    func changePortfolio(portfolio: String)
    func changeName(name: String)
    func changeYear(year: String)
    func changeAbout(about: String)
}

