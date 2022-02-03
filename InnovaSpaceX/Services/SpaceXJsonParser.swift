//
//  SpaceXJsonParser.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import Foundation

struct SpaceXJsonParser:JSonParser{
	
	func parse(data: Data) -> Result<T, TError> {
		let decoder = JSONDecoder()
		do{
			let apiResponse = try decoder.decode(T.self, from: data)
			return .success(apiResponse)
		}catch{
			print(error)
			print(error.localizedDescription)
			return .failure(.anyError(error))
		}
	}
	
	typealias T = [Launch]
	typealias TError = SpaceXApiError
}



protocol JSonParser{
	associatedtype T
	associatedtype TError:Error
	func parse(data:Data) -> Result<T,TError>
}
