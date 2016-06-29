import UIKit

class InstagramServiceViewController: BasicViewController {
    
    private let instagramUrlString = "instagram://app"
    private let imageFileName = "share.igo"
    private let instagramUTI = "com.instagram.exclusivegram"
    private let documentController = UIDocumentInteractionController()

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let instagramUrl = NSURL(string: instagramUrlString) else {
            showAlert(title: "No Instagram", message: "Counld not find Instragram for sharing.")
            return
        }
        
        if UIApplication.sharedApplication().canOpenURL(instagramUrl) {
            saveImageToLocale()
        } else {
            showAlert(title: "Fail tp open Instagram", message: "Could not open Instagram for sharing.")
        }
    }

    func saveImageToLocale() {
        guard let data = UIImageJPEGRepresentation(image, 1.0) else {
            return
        }
        
        let filePath = NSTemporaryDirectory().stringByAppendingString(imageFileName)
        print(filePath)
        data.writeToFile(filePath, atomically: true)
        
        let imageUrl = NSURL(fileURLWithPath: filePath)
        documentController.URL = imageUrl
        documentController.UTI = instagramUTI
        documentController.presentOpenInMenuFromRect(CGRectMake(0, 0, 100, 100), inView: view, animated: true)
    }
}
