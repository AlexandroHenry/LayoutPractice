//
//  FirstView.swift
//  LayoutPractice
//
//  Created by Seungchul Ha on 2023/01/16.
//

import SwiftUI

struct FirstView: View {
	let colors: [Color] = [.yellow, .orange, .red, .pink, .purple, .blue, .cyan, .green]
		
	var body: some View {
		WheelLayout(radius: 130.0, rotation: .zero) {
			ForEach(0..<8) { idx in
				RoundedRectangle(cornerRadius: 8)
					.fill(colors[idx%colors.count].opacity(0.7))
					.frame(width: 70, height: 70)
					.overlay { Text("\(idx+1)") }
			}
		}
	}
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

struct Rotation: LayoutValueKey {
	static let defaultValue: Binding<Angle>? = nil
}

struct WheelLayout: Layout {
	var radius: CGFloat
	var rotation: Angle
	
	func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		
		let maxSize = subviews.map { $0.sizeThatFits(proposal) }.reduce(CGSize.zero) {
			
			return CGSize(width: max($0.width, $1.width), height: max($0.height, $1.height))
			
		}
		
		return CGSize(width: (maxSize.width / 2 + radius) * 2,
					  height: (maxSize.height / 2 + radius) * 2)
	}
	
	func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()){
		let angleStep = (Angle.degrees(360).radians / Double(subviews.count))

		for (index, subview) in subviews.enumerated() {
			let angle = angleStep * CGFloat(index) + rotation.radians
			
			// Find a vector with an appropriate size and rotation.
			var point = CGPoint(x: 0, y: -radius).applying(CGAffineTransform(rotationAngle: angle))
			
			// Shift the vector to the middle of the region.
			point.x += bounds.midX
			point.y += bounds.midY
			
			// Place the subview.
			subview.place(at: point, anchor: .center, proposal: .unspecified)
			
			DispatchQueue.main.async {
				subview[Rotation.self]?.wrappedValue = .radians(angle)
			}
		}
	}
}

