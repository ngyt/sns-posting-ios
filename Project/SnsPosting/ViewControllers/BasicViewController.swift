import UIKit

class BasicViewController: UIViewController {

    @IBAction func onBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

}
