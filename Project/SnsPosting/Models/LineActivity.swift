import UIKit

class LineActivity: UIActivity {
    
    private let pasteboard = UIPasteboard.generalPasteboard()
    
    override func activityType() -> String? {
        return "line.com"
    }
    
    override func activityTitle() -> String? {
        return "LINE"
    }
    
    override func activityImage() -> UIImage? {
        return UIImage(named: "LineIcon.png")
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        return true
    }
    
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        
        let attachedImage: UIImage? = activityItems.flatMap{ $0 as? UIImage }.last
        
        var lineUrlString = String()
        if let image = attachedImage, data = UIImagePNGRepresentation(image)  {
            pasteboard.setData(data, forPasteboardType: "public.png")
            lineUrlString = "line://msg/image/" + pasteboard.name
        } else {
            var string: String = activityItems.flatMap{ $0 as? String }.joinWithSeparator(" ")
            string = string.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            lineUrlString = "line://msg/text/" + string
        }
        
        let url = NSURL(string: lineUrlString)!
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    override func performActivity() {
    }
}
