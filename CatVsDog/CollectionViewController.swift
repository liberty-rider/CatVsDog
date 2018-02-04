import UIKit

class CollectionViewController: UICollectionViewController {
    
    weak var vc: ViewController?


}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
}
