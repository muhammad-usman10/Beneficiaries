//
//  ViewController.swift
//  Beneficiaries
//
//  Created by ZAT on 13/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beneficiaryTbleView: UITableView!
    
    var extendedIndx = [Int]()
    var beneficiaries = [BeneficiaryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beneficiaryTbleView.delegate = self
        beneficiaryTbleView.dataSource = self
        readJSONFile(fileName: "Beneficiaries")
    }

    // MARK: - Read Json data from Json file
    
    func readJSONFile(fileName: String) {
       do {
          if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json"),
          let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
              
              guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] else {
                // appropriate error handling
                  print("Json not correct formate.")
                return
              }
              for dic in json{
                  let model = BeneficiaryModel(fromDictionary: dic)
                  beneficiaries.append(model)
              }
              beneficiaryTbleView.reloadData()
          }
       } catch {
          print(error)
       }
    }
    

}

// MARK: - Implement TableView Delegate and DataSource Methods

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beneficiaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MARK: Register Nib and Create Cell
        beneficiaryTbleView.register(UINib(nibName: Constants.TableViewCells.BeneficiariyTVCell, bundle: nil), forCellReuseIdentifier: Constants.TableViewCells.BeneficiariyTVCell)
        let cell = beneficiaryTbleView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.BeneficiariyTVCell, for: indexPath) as! BeneficiariyTVCell
        cell.configCell(beneficiary: beneficiaries[indexPath.row], isExtend: extendedIndx.contains(indexPath.row))
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indx = extendedIndx.firstIndex(of: indexPath.row){
            extendedIndx.remove(at: indx)
        }else{
            extendedIndx.append(indexPath.row)
        }
        beneficiaryTbleView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

