//
//  YearFilterView.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import SwiftUI

struct YearFilterView: View {
	@ObservedObject var launchListVM = LaunchListViewModel(session: URLSession.shared)
	
	@Binding var showModal:Bool
	@Binding var selectedYear:String
	
	
	var body: some View {
		VStack {
			let years:[Year] =
			Array(Set(launchListVM.launches.map { launchVM in
				launchVM.year
			})).map({ year in
				Year(year:year)
			})
				.sorted { y1, y2 in
					y1.year < y2.year
				}
			
			
			List{
				YearCellView(yearTitle: "All"){
					self.selectedYear = ""
					self.showModal.toggle()
				}
				ForEach(years, id:\.id) { year in
					
					YearCellView(yearTitle: year.year){
						self.selectedYear = year.year
						self.showModal.toggle()
					}
				}
			}
		}
		.listStyle(.plain)
	}
}


struct Year: Identifiable {
	let id = UUID()
	var year:String
}


struct YearFilterView_Previews: PreviewProvider {
	static var previews: some View {
		YearFilterView(showModal: .constant(false), selectedYear: .constant(""))
	}
}


struct YearCellView: View {
	let yearTitle:String
	let doSelection: ()->Void
	
	var body: some View {
		HStack{
			Spacer()
			Button {
				doSelection()
			} label: {
				Text(yearTitle)
					.font(.title)
					.bold()
			}
			
			Spacer()
		}
	}
}
