//
//  EditFileViewController.swift
//  Demo 2
//
//  Created by Frank Yang on 3/13/23.
//

import UIKit

class EditFileViewController: UIViewController {
    let profileImageView = UIImageView()
    let profileImage1Button = UIButton()
    let profileImage2Button = UIButton()
    let profileImage3Button = UIButton()
    let profileImage4Button = UIButton()
    var profileImage: ProfileImage?
    weak var delegate: ChangeImageDelegate?
    
    
    init(profileImage: ProfileImage, delegate: ChangeImageDelegate){
        self.profileImage = profileImage
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        profileImageView.image = UIImage(named: profileImage.image)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        profileImage1Button.setImage(UIImage(named: "profileImage1"), for: .normal)
        profileImage1Button.addTarget(self, action: #selector(editProfileImageButton), for:.touchUpInside)
        profileImage1Button.tag = 0
        profileImage1Button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage1Button)
        
        profileImage2Button.setImage(UIImage(named: "profileImage2"), for: .normal)
        profileImage2Button.addTarget(self, action: #selector(editProfileImageButton), for:.touchUpInside)
        profileImage2Button.tag = 1
        profileImage2Button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage2Button)
        
        profileImage3Button.setImage(UIImage(named: "profileImage3"), for: .normal)
        profileImage3Button.addTarget(self, action: #selector(editProfileImageButton), for:.touchUpInside)
        profileImage3Button.tag = 2
        profileImage3Button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage3Button)
        
        
        setupConstraints()
        
        
    }
    
    func setupConstraints(){
        let padding: CGFloat = 15
        let topPadding: CGFloat = 50
        let ratio: CGFloat = 0.45
        
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            profileImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            profileImage1Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio),
            profileImage1Button.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio),
            profileImage1Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage1Button.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: topPadding)
        ])

        NSLayoutConstraint.activate([
            profileImage2Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio),
            profileImage2Button.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio),
            profileImage2Button.topAnchor.constraint(equalTo: profileImage1Button.bottomAnchor, constant: padding),
            profileImage2Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
        ])

        NSLayoutConstraint.activate([
            profileImage3Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio),
            profileImage3Button.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio),
            profileImage3Button.topAnchor.constraint(equalTo: profileImage2Button.topAnchor),
            profileImage3Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    @objc func editProfileImageButton(sender: UIButton){
        if(sender.tag == 0){
            profileImageView.image = UIImage(named: "profileImage1")
            delegate?.changeImage(image: "profileImage1")
            profileImage?.image = "profileImage1"
        }
        
        if(sender.tag==1){
            profileImageView.image = UIImage(named: "profileImage2")
            delegate?.changeImage(image: "profileImage2")
            profileImage?.image = "profileImage2"
        }
        
        if(sender.tag==2){
            profileImageView.image = UIImage(named: "profileImage3")
            delegate?.changeImage(image: "profileImage3")
            profileImage?.image = "profileImage3"
        }
    }
    
    
}
protocol ChangeImageDelegate: ViewController{
    func changeImage(image: String)
}
