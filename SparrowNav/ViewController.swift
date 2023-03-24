//
//  ViewController.swift
//  SparrowNav
//
//  Created by Никита Курюмов on 23.03.23.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel = UILabel()
    
    
    lazy var scrollView = UIScrollView()
    
    let image: UIImageView = {
        var image = UIImageView()
        image.image =  UIImage(systemName: "person.crop.circle.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var navLabel: UILabel = {
        var label = UILabel()
        label.text = "Avatar"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            navLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            navLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            image.widthAnchor.constraint(equalToConstant: 36),
            image.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(scrollView)
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        scrollView.backgroundColor = .white
        scrollView.addSubview(image)
        scrollView.addSubview(navLabel)
        
        titleLabel.text = "Avatar"
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        titleLabel.sizeToFit()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

    }
}
extension ViewController: UINavigationBarDelegate {
    func navigationBar(_ navigationBar: UINavigationBar, shouldScrollTo item: UINavigationItem) -> Bool {
        let viewFrame = scrollView.convert(view.frame, from: view.superview)
        let navigationBarFrame = navigationBar.frame

        if viewFrame.intersects(navigationBarFrame) {
            navigationItem.title = "Avatar"
        } else {
            navigationItem.title = ""
        }
        return true
    }
}
