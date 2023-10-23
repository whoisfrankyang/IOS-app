//
//  ViewController.swift
//  Demo 2
//
//  Created by Frank Yang on 3/11/23.
//

import UIKit

class ViewController: UIViewController {
    // there exists some profileImageView
    let profileImageButton = UIButton()
    
    // create a label: for short texts
    let nameLabel = UILabel()
    
    // create a descriptionTextView for longer texts
    let descriptionTextView = UITextView()
    
    // create a botton
    var editProfileButton = UIButton()
    
    let myProfileLabel = UILabel()
    
    var portfolioTextView = UILabel()
    
    let yearLabel = UILabel()
    
    let yearTextView = UITextView()
    
    let aboutLabel = UILabel()
    
    let aboutTextView = UITextView()
    
    var profileImage: ProfileImage = ProfileImage(image: "profileImage1")
    
    var profileInfo: ProfileInfo = ProfileInfo(name: "", portfolio: "", year: "", about: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // when the app get launched, the viewDidLoad function will be run first
        // set the My Profile text
        view.backgroundColor = .white
        
        myProfileLabel.text = "My Profile"
        myProfileLabel.font = .systemFont(ofSize: 20)
        myProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myProfileLabel)
        
        //set a profileImageView to be a image path
        profileImageButton.setImage(UIImage(named: profileImage.image), for: .normal)
        //set this to be false so we can set the constraint of the elements
        profileImageButton.translatesAutoresizingMaskIntoConstraints = false
        profileImageButton.addTarget(self, action: #selector(presentView), for: .touchUpInside)
        
        view.addSubview(profileImageButton)
        
        // nameLabel
        nameLabel.text = "Frank Yang"

        // se the font size of the text
        nameLabel.font = .systemFont(ofSize: 25)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        // set the portfolio text
        portfolioTextView.text = "This is my portfolio"
        portfolioTextView.font = .systemFont(ofSize: 15)
        portfolioTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(portfolioTextView)
        
        // set the year label
        yearLabel.text = "Sophomore"
        yearLabel.font = .systemFont(ofSize: 15)
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yearLabel)
        
        // set abuot label
        aboutLabel.text = "This is everything about me"
        aboutLabel.font = .systemFont(ofSize: 15)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aboutLabel)
        
        // set the EDIT MY PROFILE button
        editProfileButton.setTitle("EDIT MY PROFILE >", for: .normal)
        editProfileButton.setTitleColor(.purple, for:. normal)
        editProfileButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileButton)
        
        
        setupConstraints()
    }
    
    
    // the function to set up the contraints of our views (objects)
    func setupConstraints(){
        // set the constraint for the myProfileLabel
        NSLayoutConstraint.activate([
            myProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myProfileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            // the image is aligned with the image (centerXAnchor) of the view
            profileImageButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            profileImageButton.heightAnchor.constraint(equalTo: profileImageButton.widthAnchor, multiplier: 1.0),
            profileImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // set the topAnchor of the image to the safeArea of the top anchor
            profileImageButton.topAnchor.constraint(equalTo: myProfileLabel.bottomAnchor, constant: 10),
        ])
        
        // set the constraint for nameLabel
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // set the topAnchor of nameLabel to bottomAnchor of the profileImage
            // with a constant gap of 30 (positive Y direction is downwards)
            nameLabel.topAnchor.constraint(equalTo: profileImageButton.bottomAnchor, constant: 30)
        ])
        
        // portfolioTextView
        NSLayoutConstraint.activate([
            portfolioTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            portfolioTextView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10)
        ])
        
        // yearLabel
        NSLayoutConstraint.activate([
            yearLabel.topAnchor.constraint(equalTo: portfolioTextView.bottomAnchor, constant: 30),
            yearLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // aboutLabel
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 30),
            aboutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // set the constraint for editProfileButton
        NSLayoutConstraint.activate([
            editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            editProfileButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        
        ])
        
        // set the constraint for changeProfileButton

    }
    
    // the function about button
    @objc func buttonAction(){
        present(EditMyProfileViewController(profileInfo: profileInfo, delegate: self), animated: true)
    }
    
    @objc func presentView(){
        present(EditFileViewController(profileImage: profileImage, delegate: self), animated: true, completion: nil)
    }
    

}

extension ViewController: ChangeImageDelegate{
    func changeImage(image: String){
        profileImageButton.setImage(UIImage(named: image), for: .normal)
    }
}

extension ViewController: ChangeProfileDelegate{
    func changePortfolio(portfolio: String){
        portfolioTextView.text = portfolio
    }
    func changeName(name: String){
        nameLabel.text = name
    }
    func changeYear(year: String){
        yearLabel.text = year
    }
    func changeAbout(about: String){
        aboutLabel.text = about
    }
}

