//
//  BeneficiaryModel.swift
//  Beneficiaries
//
//  Created by ZAT on 13/07/2023.
//

import Foundation

// MARK: - BeneficiaryModel
struct BeneficiaryModel: Codable {
    
    var beneType : String!
    var beneficiaryAddress : BeneficiaryAddres!
    var dateOfBirth : String!
    var designationCode : String!
    var firstName : String!
    var lastName : String!
    var middleName : String!
    var phoneNumber : String!
    var socialSecurityNumber : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        beneType = dictionary["beneType"] as? String
        if let beneficiaryAddressData = dictionary["beneficiaryAddress"] as? [String:Any]{
            beneficiaryAddress = BeneficiaryAddres(fromDictionary: beneficiaryAddressData)
        }
        dateOfBirth = dictionary["dateOfBirth"] as? String
        designationCode = dictionary["designationCode"] as? String
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        middleName = dictionary["middleName"] as? String
        phoneNumber = dictionary["phoneNumber"] as? String
        socialSecurityNumber = dictionary["socialSecurityNumber"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if beneType != nil{
            dictionary["beneType"] = beneType
        }
        if beneficiaryAddress != nil{
            dictionary["beneficiaryAddress"] = beneficiaryAddress.toDictionary()
        }
        if dateOfBirth != nil{
            dictionary["dateOfBirth"] = dateOfBirth
        }
        if designationCode != nil{
            dictionary["designationCode"] = designationCode
        }
        if firstName != nil{
            dictionary["firstName"] = firstName
        }
        if lastName != nil{
            dictionary["lastName"] = lastName
        }
        if middleName != nil{
            dictionary["middleName"] = middleName
        }
        if phoneNumber != nil{
            dictionary["phoneNumber"] = phoneNumber
        }
        if socialSecurityNumber != nil{
            dictionary["socialSecurityNumber"] = socialSecurityNumber
        }
        return dictionary
    }
    
}

// MARK: - BeneficiaryAddress
struct BeneficiaryAddres: Codable {
    
    var city : String!
    var country : String!
    var firstLineMailing : String!
    var scndLineMailing : String!
    var stateCode : String!
    var zipCode : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        city = dictionary["city"] as? String
        country = dictionary["country"] as? String
        firstLineMailing = dictionary["firstLineMailing"] as? String
        scndLineMailing = dictionary["scndLineMailing"] as? String
        stateCode = dictionary["stateCode"] as? String
        zipCode = dictionary["zipCode"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if city != nil{
            dictionary["city"] = city
        }
        if country != nil{
            dictionary["country"] = country
        }
        if firstLineMailing != nil{
            dictionary["firstLineMailing"] = firstLineMailing
        }
        if scndLineMailing != nil{
            dictionary["scndLineMailing"] = scndLineMailing
        }
        if stateCode != nil{
            dictionary["stateCode"] = stateCode
        }
        if zipCode != nil{
            dictionary["zipCode"] = zipCode
        }
        return dictionary
    }
    
}
