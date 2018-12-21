//
//	Forecast.swift
//
//	Create by Anderson Soares on 13/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Forecast : NSObject, NSCoding{

	var condition : String!
	var date : String!
	var descriptionField : String!
	var max : String!
	var min : String!
	var weekday : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		condition = json["condition"].stringValue
		date = json["date"].stringValue
		descriptionField = json["description"].stringValue
		max = json["max"].stringValue
		min = json["min"].stringValue
		weekday = json["weekday"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        var dictionary = [String:Any]()
		if condition != nil{
			dictionary["condition"] = condition
		}
		if date != nil{
			dictionary["date"] = date
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if max != nil{
			dictionary["max"] = max
		}
		if min != nil{
			dictionary["min"] = min
		}
		if weekday != nil{
			dictionary["weekday"] = weekday
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         condition = aDecoder.decodeObject(forKey: "condition") as? String
         date = aDecoder.decodeObject(forKey: "date") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         max = aDecoder.decodeObject(forKey: "max") as? String
         min = aDecoder.decodeObject(forKey: "min") as? String
         weekday = aDecoder.decodeObject(forKey: "weekday") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if condition != nil{
			aCoder.encode(condition, forKey: "condition")
		}
		if date != nil{
			aCoder.encode(date, forKey: "date")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if max != nil{
			aCoder.encode(max, forKey: "max")
		}
		if min != nil{
			aCoder.encode(min, forKey: "min")
		}
		if weekday != nil{
			aCoder.encode(weekday, forKey: "weekday")
		}

	}

}
