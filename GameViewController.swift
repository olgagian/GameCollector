//
//  GameViewController.swift
//  GameCollector
//
//  Created by ioannis giannakidis on 27/01/2017.
//  Copyright © 2017 ioannis giannakidis. All rights reserved.
//

import UIKit
import CoreData

class GameViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var delettButton: UIButton!
    
    @IBOutlet weak var addupdateButton: UIButton!
    var imagePicker = UIImagePickerController()
    var game: Game? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        if game != nil {
           gameImageView.image = UIImage(data:game?.image  as! Data)
            titleTextField.text = game?.title
            addupdateButton.setTitle("Update", for: .normal)
        } else {
            delettButton.isHidden = true
        }
        
            
        

        // Do any additional setup after loading the view.
    }

  
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    
    gameImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    @IBAction func addTapped(_ sender: Any) {
        if game != nil  {
            game!.title = titleTextField.text
            game!.image = UIImagePNGRepresentation(gameImageView.image!) as NSData!
        }else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let game = Game(context:context)
            game.title = titleTextField.text
            game.image = UIImagePNGRepresentation(gameImageView.image!) as NSData!
        }
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    
    }
    @IBAction func deleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(game!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}
