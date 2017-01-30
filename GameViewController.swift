//
//  GameViewController.swift
//  GameCollector
//
//  Created by ioannis giannakidis on 27/01/2017.
//  Copyright © 2017 ioannis giannakidis. All rights reserved.
//

import UIKit

class GameViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        

        // Do any additional setup after loading the view.
    }

  
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        
    }
    @IBAction func addTapped(_ sender: Any) {
        
    }
    
}
