//
//  YearFilterCellView.swift
//  InnovaSpaceX
//
//  Created by Gokhan Mutlu on 4.02.2022.
//

import SwiftUI

struct YearFilterCellView: View {
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

struct YearFilterCellView_Previews: PreviewProvider {
    static var previews: some View {
		YearFilterCellView(yearTitle: "2345", doSelection: {})
    }
}
