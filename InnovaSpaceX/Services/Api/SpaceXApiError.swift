//
//  SpaceXApiError.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 3.02.2022.
//

import Foundation

enum SpaceXApiError: Error{
	case anyError(Error)
	case jsonParsing(String)
	case statusCodeNot200(String)
}


