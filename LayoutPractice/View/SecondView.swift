//
//  SecondView.swift
//  LayoutPractice
//
//  Created by Seungchul Ha on 2023/01/16.
//

import SwiftUI

struct SecondView: View {
	let colors: [Color] = [.yellow, .orange, .red, .pink, .purple, .blue, .cyan, .green]
		
	@State var radius: CGFloat = 130
	@State var angle: Angle = .zero
	
	var body: some View {
		VStack {
			WheelLayout(radius: radius, rotation: angle) {
				ForEach(0..<8) { idx in
					RoundedRectangle(cornerRadius: 8)
						.fill(colors[idx%colors.count].opacity(0.7))
						.frame(width: 70, height: 70)
						.overlay { Text("\(idx+1)") }
				}
			}
			.padding(.bottom, 100)
			
			Button("Rotate") {
				withAnimation(.easeInOut(duration: 2.0)) {
					angle = (angle == .zero ? .degrees(90) : .zero)
				}
			}
		}
	}
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
