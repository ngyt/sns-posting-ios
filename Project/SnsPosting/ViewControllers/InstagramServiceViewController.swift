import UIKit

class InstagramServiceViewController: BasicViewController {
    
    private let instagramUrlString = "instagram://app"

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let instagramUrl = NSURL(string: instagramUrlString) else {
            showAlert(title: "No Instagram", message: "Counld not find Instragram for sharing.")
            return
        }
        
        if UIApplication.sharedApplication().canOpenURL(instagramUrl) {
            print("Found")
        } else {
            print("Nooooooooo")
        }
    }

}
