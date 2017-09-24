 //
//  QR_ViewController.swift
//  
//
//  Created by David Warren on 9/24/17.
//
//

import UIKit

class QR_ViewController: UIViewController {
    @IBOutlet weak var QRTextEntry: UITextField!
    @IBOutlet weak var QRImageGen: UIImageView!
    
    @IBAction func QRButtonGen(_ sender: Any)
    {
        if let userString = QRTextEntry.text
        {
            let data = userString.data(using: .ascii, allowLossyConversion: false) //takes our text and encodes to ascii encoding
            let filter = CIFilter(name: "CIQRCodeGenerator")  //can switch this between QR code or Bar code
            filter?.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 1, y: 1)
            
            let img = UIImage(ciImage: (filter?.outputImage?.applying(transform))!)   //creates an image based on the
            
            QRImageGen.image = img //sets the UQRImageGen outlet = to the img we created
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
