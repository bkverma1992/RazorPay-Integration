//
//  ViewController.swift
//  RazorPayProject
//
//  Created by Yugasalabs-28 on 19/06/2019.
//  Copyright © 2019 Yugasalabs-28. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController {
    private var razorpay:Razorpay?

    @IBOutlet var amountTF: UITextField!
    @IBAction func paymentBTN(_ sender: Any)
    {
        razorpayMethod()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        razorpay = Razorpay.initWithKey("rzp_test_FYCQAsmKTFF8FR", andDelegate: self)

        // Do any additional setup after loading the view.
    }

    func razorpayMethod()  {
        
        let options: [String:Any] = [
            "amount" : "100", //mandatory in paise like:- 1000 paise ==  10 rs
            "description": "purchase description",
          //  "image": "ss",
            "name": "Paramount",
            "prefill": [
                "contact": "9205726030",
               "email": "bhoopendra.yugasa@gmail.com"
            ],
            "theme": [
                "color": "#0000ff"
            ]
        ]
        razorpay?.open(options)
    }
}
extension ViewController: RazorpayPaymentCompletionProtocol {
    func onPaymentSuccess(_ payment_id: String) {
        let alert = UIAlertController(title: "Paid", message: "Payment Success", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "Error", message: "\(code)\n\(str)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

