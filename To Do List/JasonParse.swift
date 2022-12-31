//
//  JasonParse.swift
//  To Do List
//
//  Created by Labib Khan on 12/27/22.
//

import UIKit

class JasonParse: UIViewController {
    struct Student: Decodable{
        let Id: Int!
        let name: String
        let address: String
    }


    @IBOutlet weak var jsonLabel: UILabel!
    
    override func viewDidLoad() {
        
        let jsonURL = "https://mocki.io/v1/ddaa9f99-b0d2-4e09-b388-9c667fe3798a"
        
        guard let url = URL(string: jsonURL) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let pdata = data else {return}
            do{
                let student = try
                JSONDecoder().decode(Student.self, from: pdata)
                print(student.name)
                self.jsonLabel.text = student.name
                
            }catch let jsonError{print("error in parsing",jsonError)}
        }.resume()
        super.viewDidLoad()
        
        
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


