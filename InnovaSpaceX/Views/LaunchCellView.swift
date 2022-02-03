//
//  LaunchCellView.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import SwiftUI

struct LaunchCellView: View {
	let launchVM:LaunchViewModel
	
    var body: some View {
		HStack() {
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
										.frame(maxWidth: 50, maxHeight: 50)
								}
							}
							
							
						@unknown default:
							EmptyView()
					}
				}
				.frame(maxWidth: 60, maxHeight: 60)
				.cornerRadius(5)
				.shadow(color: .gray, radius:5)

				
			}else{
				Image(systemName: "photo")
					.resizable()
					.frame(maxWidth: 50, maxHeight: 50)
					.padding(2)
			}
			
			
			VStack(alignment:.leading, spacing:5) {
				Text(launchVM.missionName)
				
				HStack(spacing:5) {
					Text("Misson year:")
					Text(launchVM.year).bold()
					Text(",Rocket \(launchVM.rocketName)")
				}
				.foregroundColor(.secondary)
				.font(.caption)

			}
			
		}
	}
    
}

struct LaunchCellView_Previews: PreviewProvider {
    static var previews: some View {
		LaunchCellView(launchVM: LaunchViewModel.placeholder)
			.previewLayout(.sizeThatFits)
    }
}
