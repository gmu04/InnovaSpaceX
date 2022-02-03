//
//  LaunchViewModel.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import Foundation

struct LaunchViewModel:Identifiable{
	
	private let launch:Launch
	init(launch:Launch){ self.launch = launch }
	
	
	var id:Int{ return launch.flight_number }
	var missionName:String{ return launch.mission_name }
	var year:String{ return launch.launch_year }
	
	var rocketName:String{ return launch.rocket.rocket_name }
	var rocketType:String{ return launch.rocket.rocket_type }
	
	var missionPatch:String?{ return launch.links?.mission_patch }
	var missionPatchSmall:String?{ return launch.links?.mission_patch_small }
	
}

extension LaunchViewModel{
	static let placeholder = LaunchViewModel(launch:
		Launch(flight_number: 1,
			   mission_name: "FalconSat",
			   launch_year: "2006",
			   rocket: Rocket(rocket_name: "Falcon 1",
							  rocket_type: "Merlin A"),
			   links: LaunchLink(mission_patch: "https://images2.imgbox.com/40/e3/GypSkayF_o.png",
								 mission_patch_small: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png")))
}
