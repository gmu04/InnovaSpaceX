//
//  SpaceXService.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 3.02.2022.
//

import Foundation

final class SpaceXService<S:Session>{
	
	private var cacheManager:SearchResultCacheable! = nil
	

	//injecting session
	init(session:S){
		self.client = HttpClient(session: session)
	}
	
	//injecting session + cache manager
	convenience init(session:S, _ cacheManager:CacheManager){//CacheManager? = nil){
		self.init(session: session)
		self.cacheManager = cacheManager
	}
	
	
	internal func getLaunchList(completion:@escaping (Result<[Launch], SpaceXApiError>)->()){
		
		//check cache store first
		if let cacheManager = cacheManager,
		   let launches = cacheManager.getLaunches(){
			
			//Search term found in cache
			return completion(.success(launches))
		}
		
		
		
		//prepare search url
		guard let validUrl = URL.getSapceXUrl() else { fatalError("Url is not valid!") }
		
		//call API client to search
		client.searchFor(url: validUrl){ result in
			
			switch result{
				case .failure(let apiError):
					completion(.failure(apiError))
				
				case .success(let data):
					
					let result = SpaceXJsonParser().parse(data: data)

					//return launches
					if case let .success(launches) = result{
						//print(launches)
						
						//insert search result info cache store
						if let cacheManager = self.cacheManager{
							cacheManager.add(launches: launches, byKey: Constant.cacheKey)
						}
						
						completion(.success(launches))
					}else{
						completion(.failure(.jsonParsing("Check the logs...")))
					}
			}
		}
		
	}
	
	
	
	//MARK: - Properties
	
	private var launches:[Launch]?
	private let client:HttpClient<S>
	
}
