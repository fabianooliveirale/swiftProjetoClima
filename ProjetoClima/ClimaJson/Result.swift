//
//	Result.swift
//
//	Create by Anderson Soares on 13/12/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Result : NSObject, NSCoding{

	var cid : String!
	var city : String!
	var cityName : String!
	var conditionCode : String!
	var conditionSlug : String!
	var currently : String!
	var date : String!
	var descriptionField : String!
	var forecast : [Forecast]!
	var humidity : String!
	var imgId : String!
	var sunrise : String!
	var sunset : String!
	var temp : Int!
	var time : String!
	var windSpeedy : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		cid = json["cid"].stringValue
		city = json["city"].stringValue
		cityName = json["city_name"].stringValue
		conditionCode = json["condition_code"].stringValue
		conditionSlug = json["condition_slug"].stringValue
		currently = json["currently"].stringValue
		date = json["date"].stringValue
		descriptionField = json["description"].stringValue
		forecast = [Forecast]()
		let forecastArray = json["forecast"].arrayValue
		for forecastJson in forecastArray{
			let value = Forecast(fromJson: forecastJson)
			forecast.append(value)
		}
		humidity = json["humidity"].stringValue
		imgId = json["img_id"].stringValue
		sunrise = json["sunrise"].stringValue
		sunset = json["sunset"].stringValue
		temp = json["temp"].intValue
		time = json["time"].stringValue
		windSpeedy = json["wind_speedy"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        var dictionary = [String:Any]()
		if cid != nil{
			dictionary["cid"] = cid
		}
		if city != nil{
			dictionary["city"] = city
		}
		if cityName != nil{
			dictionary["city_name"] = cityName
		}
		if conditionCode != nil{
			dictionary["condition_code"] = conditionCode
		}
		if conditionSlug != nil{
			dictionary["condition_slug"] = conditionSlug
		}
		if currently != nil{
			dictionary["currently"] = currently
		}
		if date != nil{
			dictionary["date"] = date
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if forecast != nil{
			var dictionaryElements = [[String:Any]]()
			for forecastElement in forecast {
				dictionaryElements.append(forecastElement.toDictionary())
			}
			dictionary["forecast"] = dictionaryElements
		}
		if humidity != nil{
			dictionary["humidity"] = humidity
		}
		if imgId != nil{
			dictionary["img_id"] = imgId
		}
		if sunrise != nil{
			dictionary["sunrise"] = sunrise
		}
		if sunset != nil{
			dictionary["sunset"] = sunset
		}
		if temp != nil{
			dictionary["temp"] = temp
		}
		if time != nil{
			dictionary["time"] = time
		}
		if windSpeedy != nil{
			dictionary["wind_speedy"] = windSpeedy
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         cid = aDecoder.decodeObject(forKey: "cid") as? String
         city = aDecoder.decodeObject(forKey: "city") as? String
         cityName = aDecoder.decodeObject(forKey: "city_name") as? String
         conditionCode = aDecoder.decodeObject(forKey: "condition_code") as? String
         conditionSlug = aDecoder.decodeObject(forKey: "condition_slug") as? String
         currently = aDecoder.decodeObject(forKey: "currently") as? String
         date = aDecoder.decodeObject(forKey: "date") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         forecast = aDecoder.decodeObject(forKey: "forecast") as? [Forecast]
         humidity = aDecoder.decodeObject(forKey: "humidity") as? String
         imgId = aDecoder.decodeObject(forKey: "img_id") as? String
         sunrise = aDecoder.decodeObject(forKey: "sunrise") as? String
         sunset = aDecoder.decodeObject(forKey: "sunset") as? String
         temp = aDecoder.decodeObject(forKey: "temp") as? Int
         time = aDecoder.decodeObject(forKey: "time") as? String
         windSpeedy = aDecoder.decodeObject(forKey: "wind_speedy") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if cid != nil{
			aCoder.encode(cid, forKey: "cid")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if cityName != nil{
			aCoder.encode(cityName, forKey: "city_name")
		}
		if conditionCode != nil{
			aCoder.encode(conditionCode, forKey: "condition_code")
		}
		if conditionSlug != nil{
			aCoder.encode(conditionSlug, forKey: "condition_slug")
		}
		if currently != nil{
			aCoder.encode(currently, forKey: "currently")
		}
		if date != nil{
			aCoder.encode(date, forKey: "date")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if forecast != nil{
			aCoder.encode(forecast, forKey: "forecast")
		}
		if humidity != nil{
			aCoder.encode(humidity, forKey: "humidity")
		}
		if imgId != nil{
			aCoder.encode(imgId, forKey: "img_id")
		}
		if sunrise != nil{
			aCoder.encode(sunrise, forKey: "sunrise")
		}
		if sunset != nil{
			aCoder.encode(sunset, forKey: "sunset")
		}
		if temp != nil{
			aCoder.encode(temp, forKey: "temp")
		}
		if time != nil{
			aCoder.encode(time, forKey: "time")
		}
		if windSpeedy != nil{
			aCoder.encode(windSpeedy, forKey: "wind_speedy")
		}

	}

}
