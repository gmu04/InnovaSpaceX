//
//  YearFilterView.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import SwiftUI

struct YearFilterView: View {
	@Binding var showModal:Bool
	@Binding var selectedYear:String
	let years:[String]

	
	var body: some View {
		VStack {
			
			List{
				YearFilterCellView(yearTitle: "All"){
					self.selectedYear = ""
					self.showModal.toggle()
				}
				ForEach(years, id:\.self) { year in
					
					YearFilterCellView(yearTitle: year){
						self.selectedYear = year
						self.showModal.toggle()
					}
				}
			}
		}
		.listStyle(.plain)
	}
}

struct YearFilterView_Previews: PreviewProvider {
	static var previews: some View {
		YearFilterView(showModal: .constant(false), selectedYear: .constant(""), years:["2333","2334"])
	}
}



