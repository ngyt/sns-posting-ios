//
//  InstagramService.swift
//  SnsPosting
//
//  Created by CHEN ANGIE on 6/29/16.
//  Copyright © 2016 CHEN ANGIE. All rights reserved.
//

import UIKit

class InstagramService {
    private let documentController: UIDocumentInteractionController
    private let instagramUrlString = "instagram://app"
    private let imageFileName = "share.igo"
    private let instagramUTI = "com.instagram.exclusivegram"
    
    init(documentController: UIDocumentInteractionController) {
        self.documentController = documentController
        self.documentController.UTI = instagramUTI
    }
    
    func isAvailable() -> Bool {
        guard let instagramUrl = NSURL(string: instagramUrlString) else {
            return false
        }
        
        return UIApplication.sharedApplication().canOpenURL(instagramUrl)
    }
    
    func setImage(image: UIImage) -> Bool {
        guard let data = UIImageJPEGRepresentation(image, 1.0) else {
            return false
        }
        
        let filePath = NSTemporaryDirectory().stringByAppendingString(imageFileName)
        print(filePath)
        data.writeToFile(filePath, atomically: true)
        
        let imageUrl = NSURL(fileURLWithPath: filePath)
        documentController.URL = imageUrl
        return true
    }
    
    func share(rect: CGRect, inView view: UIView) {
        documentController.presentOpenInMenuFromRect(rect, inView: view, animated: true)
    }
}
