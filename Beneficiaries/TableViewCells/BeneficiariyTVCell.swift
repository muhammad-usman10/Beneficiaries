//
//  BeneficiariyTVCell.swift
//  Beneficiaries
//
//  Created by ZAT on 13/07/2023.
//

import UIKit

class BeneficiariyTVCell: UITableViewCell {
    
    @IBOutlet weak var lblFName: UILabel!
    @IBOutlet weak var lblLName: UILabel!
    @IBOutlet weak var lblBeneType: UILabel!
    @IBOutlet weak var lblDestination: UILabel!
    @IBOutlet weak var lblSSN: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var lblPhoneNo: UILabel!
    @IBOutlet weak var lblFirstLineMailing: UILabel!
    @IBOutlet weak var lblScndLineMailing: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblZipCode: UILabel!
    @IBOutlet weak var lblStateCode: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var viewSSN: UIView!
    @IBOutlet weak var viewDOB: UIView!
    @IBOutlet weak var viewPhoneNo: UIView!
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var viewFirstLineMailing: UIView!
    @IBOutlet weak var viewScndLineMailing: UIView!
    @IBOutlet weak var viewCity: UIView!
    @IBOutlet weak var viewZipCode: UIView!
    @IBOutlet weak var viewStateCode: UIView!
    @IBOutlet weak var viewCountry: UIView!

    var formatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(beneficiary: BeneficiaryModel, isExtend: Bool){
        lblFName.text = beneficiary.firstName
        lblLName.text = beneficiary.lastName
        lblBeneType.text = beneficiary.beneType
        if beneficiary.designationCode?.lowercased() == "c"{
            lblDestination.text = "Contingent"
        }else if beneficiary.designationCode?.lowercased() == "p"{
            lblDestination.text = "Primary"
        }
        
        lblSSN.text = beneficiary.socialSecurityNumber
        formatter.dateFormat = "MMddyyyy"
        let date = formatter.date(from: beneficiary.dateOfBirth ?? "")
        formatter.dateFormat = "MM/dd/yyyy"
        lblDOB.text = formatter.string(from: date ?? Date())
        lblPhoneNo.text = beneficiary.phoneNumber
        lblFirstLineMailing.text = beneficiary.beneficiaryAddress?.firstLineMailing
        lblScndLineMailing.text = beneficiary.beneficiaryAddress?.scndLineMailing
        lblCity.text = beneficiary.beneficiaryAddress?.city
        lblZipCode.text = beneficiary.beneficiaryAddress?.zipCode
        lblStateCode.text = beneficiary.beneficiaryAddress?.stateCode
        lblCountry.text = beneficiary.beneficiaryAddress?.country
        if isExtend{
            viewSSN.isHidden = false
            viewDOB.isHidden = false
            viewPhoneNo.isHidden = false
            viewAddress.isHidden = false
            viewFirstLineMailing.isHidden = false
            viewScndLineMailing.isHidden = false
            viewCity.isHidden = false
            viewZipCode.isHidden = false
            viewStateCode.isHidden = false
            viewCountry.isHidden = false
        }else{
            viewSSN.isHidden = true
            viewDOB.isHidden = true
            viewPhoneNo.isHidden = true
            viewAddress.isHidden = true
            viewFirstLineMailing.isHidden = true
            viewScndLineMailing.isHidden = true
            viewCity.isHidden = true
            viewZipCode.isHidden = true
            viewStateCode.isHidden = true
            viewCountry.isHidden = true
        }
    }
    
}
