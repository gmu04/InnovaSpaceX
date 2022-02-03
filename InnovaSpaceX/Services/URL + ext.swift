//
//  URL + ext.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 3.02.2022.
//

import Foundation

extension URL{
	//EXPLANATION: Define possiple paths here...
	/*enum SpaceXUrl{
		case xxx(term:String)
	}*/
	
	static func getSapceXUrl()/*_ urlSpaceX:SpaceXUrl)*/ -> URL?{
		var c = URLComponents()
		c.scheme = "https"
		c.host = "api.spacexdata.com"
		c.path = "/v2/launches"

		
		//EXPLANATION: generally apsps use different paths or urls have query string parameters
		/*
		switch urlSpaceX {
			case .xxx(let term):
				let termCleaned = term
					.components(separatedBy: .whitespacesAndNewlines)
					.joined(separator: " ")
					.trimmingCharacters(in: .whitespaces)
				
				c.queryItems?.append(URLQueryItem(name: "search", value: termCleaned))
				
				
			@unknown default:
				fatalError("Please define url in SpaceXUrl enum")
				
		}
		*/
		return c.url
	}
	
}
