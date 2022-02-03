//
//  LaunchDetailView.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import SwiftUI

struct LaunchDetailView: View {
	
	let launchVM:LaunchViewModel
	
	var body: some View {
		VStack() {
			if
				let urlString = launchVM.missionPatchSmall,
				let url = URL(string: urlString){
				
				AsyncImage(url: url) { phase in
					switch phase {
						case .empty:
							ProgressView()
								.padding(.trailing, 20)
						case .success(let image):
							image
								.resizable()
								.scaledToFill()
								
						
						case .failure:
							AsyncImage(url: url) { phase in
								if let image = phase.image {
									image
										.resizable()
										.scaledToFill()
									
								} else {
									
									Image(systemName: "photo")
										.resizable()
								}
							}
							
							
						@unknown default:
							EmptyView()
					}
				}
				.scaledToFit()
				.frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.4)
				.shadow(color: .gray, radius:5)

				
			}else{
				Image(systemName: "photo")
					.scaledToFit()
					.frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.4)
			}
			
			Text("Misson info")
				.font(.title)
				.bold()
				.padding()
			
			Divider()
		
			VStack(alignment:.leading) {
				Text("Name: \(launchVM.missionName)")
					.padding()
				
				HStack(spacing:5) {
					Text("Year:")
					Text(launchVM.year).bold()
				}
				.foregroundColor(.secondary)
				.padding()

				Text("Rocket: \(launchVM.rocketName)")
					.foregroundColor(.secondary)
					.padding()
				
			}
			
			
			Spacer()
			
		}
	}
}

struct LaunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
		LaunchDetailView(launchVM: LaunchViewModel.placeholder)
    }
}
