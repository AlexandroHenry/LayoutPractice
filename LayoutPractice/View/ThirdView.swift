//
//  ThirdView.swift
//  LayoutPractice
//
//  Created by Seungchul Ha on 2023/01/16.
//

import SwiftUI

struct ThirdView: View {
   
	let colors: [Color] = [.yellow, .orange, .red, .pink, .purple, .blue, .cyan, .green]
		
	@State var radius: CGFloat = 130
	@State var angle: Angle = .zero
	
	@State var rotations: [Angle] = Array<Angle>(repeating: .zero, count: 16)
	
	var body: some View {
		WheelLayout(radius: radius, rotation: angle) {
			ForEach(0..<16) { idx in
				RoundedRectangle(cornerRadius: 8)
					.fill(colors[idx%colors.count].opacity(0.7))
					.frame(width: 70, height: 70)
					.overlay { Text("\(idx+1)") }
					.rotationEffect(rotations[idx])
					.layoutValue(key: Rotation.self, value: $rotations[idx])
			}
		}
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
