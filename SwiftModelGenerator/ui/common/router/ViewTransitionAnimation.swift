//
//  ViewTransitionAnimation.swift
//  SwiftModelGenerator
//
//  Created by Dmytro Romaniuk on 8/24/18.
//  Copyright © 2018 rodmytro. All rights reserved.
//

import Foundation
import AppKit

struct ViewTransitionAnimation {
    let delay: Double
    let currentViewAnimation: ((NSView) -> Void)
    let destinationViewAnimation: ((NSView, NSView) -> Void)
    
    static var fade: ViewTransitionAnimation {
        let duration = 0.3
        return ViewTransitionAnimation(
            delay: duration,
            currentViewAnimation: {current in }, //current.animate().opacity(to: 0).start() },
            destinationViewAnimation: {container, destination in
                destination.wantsLayer = true
                destination.layer?.opacity = 0
                
        }) //destination.animate().opacity(to: 1).start() })
    }
    
    static var left: ViewTransitionAnimation {
        return ViewTransitionAnimation(
            delay: 0.55,
            currentViewAnimation: {current in }, //current.animate().moveHorizontally(toX: Double(-1 * current.frame.width), withDuration: 0.4).start()},
            destinationViewAnimation: {container, destination in
                destination.frame = NSMakeRect(container.frame.maxX, container.frame.minY, container.frame.width, container.frame.height)
                
        //        destination.animate().moveHorizontally(toX: 0, withDuration: 0.4).start()
        })
    }
    
    static var right: ViewTransitionAnimation {
        return ViewTransitionAnimation(
            delay: 0.55,
            currentViewAnimation: {current in }, //current.animate().moveHorizontally(toX: Double(current.frame.width), withDuration: 0.4).start()},
            destinationViewAnimation: {container, destination in
                destination.frame = NSMakeRect(-1 * container.frame.width, container.frame.minY, container.frame.width, container.frame.height)
                
        //        destination.animate().moveHorizontally(toX: 0, withDuration: 0.4).start()
        })
    }
}

struct ParallaxViewTransitionAnimation {
    let delay: Double
    
    let currentViewAnimation: ((NSView) -> Void)
    let destinationViewAnimation: ((NSView) -> Void)
    
    static var Fade: ParallaxViewTransitionAnimation {
        let duration = 0.3
        return ParallaxViewTransitionAnimation(
            delay: duration,
            currentViewAnimation: {current in },
            destinationViewAnimation: {destination in})
    }
    
    static var Left: ParallaxViewTransitionAnimation {
        let duration = 0.3
        return ParallaxViewTransitionAnimation(
            delay: duration,
            currentViewAnimation: {current in },
            destinationViewAnimation: {destination in})
    }
}
