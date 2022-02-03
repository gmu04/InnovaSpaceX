//
//  Launch.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 3.02.2022.
//

import Foundation

struct Launch:Decodable{
	let flight_number:Int
	let mission_name:String
	let launch_year:String
	
	let rocket:Rocket
	let links:LaunchLink?
}

struct Rocket:Decodable{
	let rocket_name:String
	let rocket_type:String
}

struct LaunchLink:Decodable{
	let mission_patch:String?
	let mission_patch_small:String?
}

	
