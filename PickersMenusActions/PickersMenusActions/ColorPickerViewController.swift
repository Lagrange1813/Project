//
//  ColorPickerViewController.swift
//  PickersMenusActions
//
//  Created by Gabriel Theodoropoulos.
//

import UIKit

class ColorPickerViewController: UIViewController, UIColorPickerViewControllerDelegate {

    @IBOutlet weak var colorSampleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pickColor(_ sender: Any) {
        let picker = UIColorPickerViewController()
        picker.selectedColor = colorSampleView.backgroundColor ?? UIColor.black
        picker.delegate = self
        picker.supportsAlpha = false
        self.present(picker, animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorSampleView.backgroundColor = viewController.selectedColor
//        viewController.dismiss(animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {}

}
