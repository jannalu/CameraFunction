//
//  ViewController.swift
//  CameraFunc
//
//  Created by Janna Lu on 1/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.backgroundColor = .secondarySystemBackground
        
        button.backgroundColor = .systemBlue
        button.setTitle("Take Picture",
                        for: .normal)
        button.setTitleColor(.white,
                             for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(){
        let picker = UIImagePickerController()//picker can be named anything
        if UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            picker.sourceType = .camera //.photolibrary for photolibrary
            //picker.allowsEditing = true
            picker.delegate = self
            self .present(picker, animated: true, completion: nil)

        }
    
        
    }
}

extension ViewController: UIImagePickerControllerDelegate, 
    UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, 
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //picker.dismiss(animated:true, completion:nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.image = image
            dismiss(animated:true)
     
        }
        //imageView.image = image
    }
    
}
