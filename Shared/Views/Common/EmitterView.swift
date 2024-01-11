//
//  EmitterView.swift
//  Notepad
//
//  Created by supan on 09/01/24.
//

import SwiftUI
import UIKit

struct EmitterView: UIViewRepresentable {
    
//    typealias UIViewType = UIView

    
    //MARK: Variables
    let emitterConfiguration : [EmitterConfiguration] = [
        EmitterConfiguration(birthRate: 300, lifetime: 30, velocity: 100.0, velocityRange: 100, xAcceleration: 4, yAcceleration: 1, emissionRange: 180 * .pi, spin: 90 * .pi, spinRange: 100 * (.pi / 180.0), scale: 0.04, scaleRange: 0.25),
    
        EmitterConfiguration(birthRate: 150, lifetime: 30, velocity: 20.0, velocityRange: 100, xAcceleration: 4, yAcceleration: 0, emissionRange: 10.0 * .pi, spin: 90 * .pi, spinRange: 100 * (.pi / 180), scale: 0.05, scaleRange: 0.24)
    ]
    
    
    //MARK: Functions
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: UIScreen.main.bounds.width, height: 44)
        let containerView = UIView(frame: CGRect(origin: .zero, size: size))
        
        
        var emitterCells: [CAEmitterCell] = []
        
        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = containerView.frame
        
        containerView.layer.addSublayer(particlesLayer)
        containerView.layer.masksToBounds = true
        
        particlesLayer.emitterShape = .circle
        particlesLayer.emitterPosition = CGPoint(x: 600, y: 0)
        particlesLayer.emitterSize = CGSize(width: 1648.0, height: 48)
        particlesLayer.emitterMode = .volume
        particlesLayer.renderMode = .unordered
        
        for configuration in emitterConfiguration {
            let emittercell = CAEmitterCell()
            
            emittercell.contents = configuration.content
            emittercell.birthRate = configuration.birthRate
            emittercell.lifetime = configuration.lifetime
            
            emittercell.velocity = configuration.velocity
            emittercell.velocityRange = configuration.velocityRange
            
            emittercell.xAcceleration = configuration.xAcceleration
            emittercell.yAcceleration = configuration.yAcceleration
            emittercell.emissionRange = configuration.emissionRange
            
            emittercell.spinRange = configuration.spinRange
            emittercell.spin = configuration.spin
            emittercell.scale = configuration.scale
            emittercell.scaleRange = configuration.scaleRange
        
            emitterCells.append(emittercell)
        }
        
        particlesLayer.emitterCells = emitterCells
        return containerView
    }
    
    
    func updateUIView(_ uiView: UIView, context: Context) {
        //Code here
    }
    
    //MARK: Main View
}

struct EmitterView_Previews: PreviewProvider {
    static var previews: some View {
        EmitterView()
    }
}
