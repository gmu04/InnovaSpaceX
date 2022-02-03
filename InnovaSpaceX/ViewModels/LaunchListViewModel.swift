//
//  LaunchListViewModel.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import Foundation
import Combine


class LaunchListViewModel<S:Session>:ObservableObject{
	
	@Published var launches = [LaunchViewModel]()
	
	private var service:SpaceXService<S>!
	private let cacheManager = CacheManager.shared
	
	
	init(session:S){
		self.service = SpaceXService(session: session, cacheManager)
		
		//call service to cache launches...
		self.getLaunchList()
	}
	
	func getLaunchList(){
		self.service.getLaunchList { result in
			switch result {
					
				case .failure(let err):
					//FIXME: edge case - what is the best solution here?
					print(err)
					
				case .success(let launches):
					//print("\n------\(term)------")
					DispatchQueue.main.async {
						self.launches = launches.map{ LaunchViewModel(launch: $0) }
						//print(launches)
					}
			}
		}
	}
	
}


