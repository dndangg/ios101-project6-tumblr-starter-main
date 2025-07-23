//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Dylan on 7/23/25.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let post = post else {
            print("Error: Post was nil in DetailViewController")
            return
        }

        // Do any additional setup after loading the view.
        if let photo = post.photos.first {
            let imageUrl = photo.originalSize.url
            let request = ImageRequest(url: imageUrl)

            Task {
                do {
                    let image = try await ImagePipeline.shared.image(for: request)
                    imageView.image = image
                } catch {
                    print("Failed to load image: \(error)")
                }
            }
        }

        captionTextView.text = post.caption.trimHTMLTags()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
