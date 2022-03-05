//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Анастасия Стрекалова on 24.01.2022.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished")
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
