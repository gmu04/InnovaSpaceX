//
//  LaunchListView.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import SwiftUI
import Combine

struct LaunchListView: View {
	
	@ObservedObject var launchListVM = LaunchListViewModel(session: URLSession.shared)
	
	@State private var showModal = false
	@State private var selectedYear = ""
	
    var body: some View {
		NavigationView {
			VStack {
				
				let launchesByYear = launchListVM.launches.filter{ launchVM in
					selectedYear.trimmingCharacters(in: .whitespacesAndNewlines) == "" ?
						true : launchVM.year == self.selectedYear
				}
				
				List{
					ForEach(launchesByYear, id: \.id) { launchVM in
						NavigationLink {
							LaunchDetailView(launchVM: launchVM)
						} label: {
							LaunchCellView(launchVM: launchVM)
						}
					}
				}
				.listStyle(.plain)
				
			}
			.sheet(isPresented: $showModal) {
				
			} content: {
				let years:[String] =
					Array(Set(launchListVM.launches.map { $0.year })).sorted()

				YearFilterView(showModal: $showModal, selectedYear:$selectedYear, years:years)
			}
			.navigationBarTitle("SpaceX Launches", displayMode: .inline)
			.navigationBarItems(
				trailing:
					Button(action: {
						self.showModal.toggle()
					}, label: {
						Image(systemName:"magnifyingglass")
							.resizable()
							.frame(width: 24, height: 24)
					})
			)
		}
		
    }
}

struct LaunchListView_Previews: PreviewProvider {
    static var previews: some View {
		LaunchListView()
    }
}
