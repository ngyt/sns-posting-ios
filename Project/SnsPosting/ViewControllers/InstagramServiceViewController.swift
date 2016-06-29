import UIKit

class InstagramServiceViewController: BasicViewController {
    
    private let instagramService = InstagramService(documentController: UIDocumentInteractionController())

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if !instagramService.isAvailable() {
            showAlert(title: "Error", message: "Could not share via Instagram.")
            shareButton.enabled = false
        }
        
        instagramService.setImage(image)
    }
    
    @IBAction func onShareButton(sender: AnyObject) {
        instagramService.share(CGRectMake(0, 0, 0, 0), inView: view)
        
    }

}
