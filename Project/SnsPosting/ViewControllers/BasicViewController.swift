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
            let alert = UIAlertController(title: "Error", message: "No photo for testing.", preferredStyle: .Alert)
            presentViewController(alert, animated: true, completion: nil)
        }
    }

    @IBAction func onBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

}
