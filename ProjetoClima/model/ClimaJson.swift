//
//	RootClass.swift
//
//	Create by Anderson Soares on 14/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class ClimaJson : NSObject, NSCoding{

	var by : String!
	var executionTime : Int!
	var fromCache : Bool!
	var results : Result!
	var validKey : Bool!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		by = json["by"].stringValue
		executionTime = json["execution_time"].intValue
		fromCache = json["from_cache"].boolValue
		let resultsJson = json["results"]
		if !resultsJson.isEmpty{
			results = Result(fromJson: resultsJson)
		}
		validKey = json["valid_key"].boolValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        var dictionary = [String:Any]()
		if by != nil{
			dictionary["by"] = by
		}
		if executionTime != nil{
			dictionary["execution_time"] = executionTime
		}
		if fromCache != nil{
			dictionary["from_cache"] = fromCache
		}
		if results != nil{
			dictionary["results"] = results.toDictionary()
		}
		if validKey != nil{
			dictionary["valid_key"] = validKey
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         by = aDecoder.decodeObject(forKey: "by") as? String
         executionTime = aDecoder.decodeObject(forKey: "execution_time") as? Int
         fromCache = aDecoder.decodeObject(forKey: "from_cache") as? Bool
         results = aDecoder.decodeObject(forKey: "results") as? Result
         validKey = aDecoder.decodeObject(forKey: "valid_key") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if by != nil{
			aCoder.encode(by, forKey: "by")
		}
		if executionTime != nil{
			aCoder.encode(executionTime, forKey: "execution_time")
		}
		if fromCache != nil{
			aCoder.encode(fromCache, forKey: "from_cache")
		}
		if results != nil{
			aCoder.encode(results, forKey: "results")
		}
		if validKey != nil{
			aCoder.encode(validKey, forKey: "valid_key")
		}

	}

}
