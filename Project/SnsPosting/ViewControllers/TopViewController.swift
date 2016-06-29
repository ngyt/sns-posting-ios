import UIKit

let TopToActivity = "TopToActivity"
let TopToInstagram = "TopToInstagram"

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onActivityButton(sender: AnyObject) {
        performSegueWithIdentifier(TopToActivity, sender: nil)
    }

    @IBAction func onInstagramServiceButton(sender: AnyObject) {
        performSegueWithIdentifier(TopToInstagram, sender: nil)
    }
}

