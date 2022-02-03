//
//  CacheManager.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import Foundation


class CacheManager:SearchResultCacheable{
	
	private init(){ }
	static let shared = CacheManager()
	
	private(set) var store = NSCache<NSString, SearchEntry>()
	
	
	func getLaunches() -> [Launch]? {
		guard let searchStoreItem = store.object(forKey: NSString(string: Constant.cacheKey)) else { return nil }
		return searchStoreItem.launches
	}
	
	func add(launches:[Launch], byKey key:String){
		store.removeObject(forKey: NSString(string: key))
		store.setObject(SearchEntry(launches: launches), forKey: NSString(string: key))
	}
	
}



protocol SearchResultCacheable{
	var store:NSCache<NSString, SearchEntry>{ get }
	
	func getLaunches() -> [Launch]?
	func add(launches:[Launch], byKey term:String)
}



/**
 Each search query creates a cache storage
 */
class SearchEntry:NSObject{
	var launches:[Launch]
	
	init(launches:[Launch]){
		self.launches = launches
	}
}

