//
//  ImageManager.swift
//  ImageSelector
//
//  Created by 张维熙 on 2022/4/30.
//

import UIKit

enum ImagePickingError: Error {
    case noError
    case cameraNotAvailable
    case libraryNotAvailable
    case userCancelled
    case invalidImage
    case invalidDir
    case invalidSize
    case uncroppedImage
    case accessDenied
}

protocol ImageManagerDelegate {
    func handle(with image: UIImage, with error: ImagePickingError)
}

class ImageManager: NSObject {
    private let picker: UIImagePickerController
    private var rootViewController: UIViewController
    private var delegate: ImageManagerDelegate?
    
    
    
    init(viewController: UIViewController, delegate: ImageManagerDelegate?) {
        self.picker = UIImagePickerController()
        self.rootViewController = viewController
        self.delegate = delegate
        super.init()
        
        picker.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func showAction() {
        let alert = UIAlertController(title: "选择图片", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "拍照", style: UIAlertAction.Style.default, handler: { _ in
            self.fetchFromCamera()
        }))
        alert.addAction(UIAlertAction(title: "从手机相册选择", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel))
        rootViewController.present(alert, animated: true)
        
        
    }
    
    private func fetchFromCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }
        
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        rootViewController.present(picker, animated: true)
    }
    
    private func fetchFromLibrary() {}
}

extension ImageManager: UIImagePickerControllerDelegate {}

extension ImageManager: UINavigationControllerDelegate {}
