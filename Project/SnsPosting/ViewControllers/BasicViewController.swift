import UIKit

class BasicViewController: UIViewController {
    
    var image: UIImage!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let image = UIImage(named: "SharePhoto") {
            self.image  = image
            imageView.image = image
        } else {
            shareButton.enabled = false
            showAlert(title: "Error", message: "No photo for testing.")
        }
    }

    @IBAction func onBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    func showAlert(title title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .Default, handler: nil)]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        _ = actions.map { alert.addAction($0) }
        presentViewController(alert, animated: true, completion: nil)
    }
}
