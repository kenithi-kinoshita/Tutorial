//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by 木下健一 on 2021/08/06.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
            
                HexagonParameters.segments.forEach { segmet in
                    path.addLine(
                        to: CGPoint(
                            x: width * segmet.line.x + xOffset,
                            y: height * segmet.line.y
                        )
                
                    )
                
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segmet.curve.x + xOffset,
                            y: height * segmet.curve.y
                        ),
                        control: CGPoint(
                            x: width * segmet.control.x + xOffset,
                            y: height * segmet.control.y
                        )
                    )
                }
            }
            .fill(LinearGradient(
                    gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green:172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
