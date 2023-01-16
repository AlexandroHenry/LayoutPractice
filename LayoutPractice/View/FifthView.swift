//
//  FifthView.swift
//  LayoutPractice
//
//  Created by Seungchul Ha on 2023/01/16.
//

import SwiftUI

struct FifthView: View {
	let colors: [Color] = [.yellow, .orange, .red, .pink, .purple, .blue, .cyan, .green]
	let job: [String] = ["square.and.arrow.up", "photo", "arrow.left.arrow.right", "square.and.pencil", "hands.clap.fill", "bookmark", "doc.on.clipboard", "globe"]
	let jobname: [String] = ["공유", "이미지", "비교", "메모", "기도", "책갈피", "복사", "커뮤니티"]
	
	@State var showRevolve: Bool = false
		
	@State var radius: CGFloat = 130
	@State var angle: Angle = .zero
	
	var body: some View {
		VStack {
			
			if showRevolve {
				Text("True")
			} else {
				Text("False")
			}
			
			WheelLayout(radius: radius, rotation: angle) {
				ForEach(0..<8) { idx in
					SampleButton(idx: idx)
				}
			}
			.padding(.bottom, 100)
			.opacity(showRevolve ? 100 : 0)
			
			Button("Rotate") {
				if showRevolve {
					showRevolve.toggle()
					
					withAnimation(.easeInOut(duration: 1.0)) {
						angle = (angle == .zero ? .degrees(120) : .zero)
					}
				} else {
					showRevolve.toggle()
				}
			}
		}
	}
	

	
	@ViewBuilder
	func SampleButton(idx: Int) -> some View {
		Button {
			
		} label: {
			VStack {
				Text(jobname[idx])
				Image(systemName: "\(job[idx])")
			}
			.frame(width: 60, height: 60)
			.padding(10)
			.background(colors[idx].opacity(0.7))
			.foregroundColor(.black)
			.clipShape(Circle())
		}
	}
}

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
