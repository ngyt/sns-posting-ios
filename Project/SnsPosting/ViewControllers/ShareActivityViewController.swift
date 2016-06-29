import UIKit

class ShareActivityViewController: BasicViewController {

    private let message = "Share message."
    private let urlString = "https://www.google.co.jp"

    @IBOutlet weak var messageSwitch: UISwitch!
    @IBOutlet weak var urlSwitch: UISwitch!
    @IBOutlet weak var imageSwitch: UISwitch!
    
    @IBAction func onShareButton(sender: AnyObject) {
        var items = [AnyObject]()
        if messageSwitch.on {
            items.append(message)
        }
        
        if urlSwitch.on {
            items.append(urlString)
        }
        
        if imageSwitch.on {
            items.append(image)
        }
        
        if NSProcessInfo().isOperatingSystemAtLeastVersion(NSOperatingSystemVersion(majorVersion: 9, minorVersion: 0, patchVersion: 0)) {
            share(items, activities: [])
        } else {
            share(items, activities: [LineActivity()])
        }
    }
    
    private func share(items: [AnyObject], activities: [UIActivity]?) {
        let activity = UIActivityViewController(activityItems: items, applicationActivities: activities)
        activity.excludedActivityTypes = [
            UIActivityTypePostToWeibo,
            UIActivityTypeMessage,
            UIActivityTypePrint,
            UIActivityTypeCopyToPasteboard,
            UIActivityTypeAssignToContact,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList,
            UIActivityTypePostToFlickr,
            UIActivityTypePostToVimeo,
            UIActivityTypePostToTencentWeibo,
            UIActivityTypeAirDrop]
        self.presentViewController(activity, animated: true, completion: nil)
    }}
