//
//  ViewController.swift
//  Currency Converter App
//
//  Created by Mahmut Şenbek on 1.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func converButton(_ sender: Any) {
        
   let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            } else {
                
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        DispatchQueue.main.sync {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(String(cad))"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(String(chf))"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(String(gbp))"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(String(jpy))"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(String(usd))"
                                }
                                if let trytl = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(String(trytl))"
                                }
                            }
                        }
                      
                        
                    }catch{
                        print("error")
                    }
                    
                }
            }
        }
        task.resume()
            
        }
    }
    


