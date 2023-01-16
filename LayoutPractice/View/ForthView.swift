//
//  ForthView.swift
//  LayoutPractice
//
//  Created by Seungchul Ha on 2023/01/16.
//

import SwiftUI

struct ForthView: View {
    var body: some View {
		CrashLayout {
			Text("Hello, World!")
		}
    }
}

struct ForthView_Previews: PreviewProvider {
    static var previews: some View {
        ForthView()
    }
}

struct CrashLayout: Layout {
	func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		if proposal.width == 0 {
			return CGSize(width: CGFloat.infinity, height: CGFloat.infinity)
		} else if proposal.width == .infinity {
			return CGSize(width: 0, height: 0)
		}
		
		return CGSize(width: 0, height: 0)
	}
	
	func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ())
	{
	}
}
