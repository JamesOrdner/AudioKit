//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
//:
//: ---
//:
//: ## Stereo Panning
//: ### Panning is a basic operation that is essential to mixing and direction perception and it couldn't be easier with AKPanner.
import XCPlayground
import AudioKit

let audiokit = AKManager.sharedInstance

//: Set up the audio player
let bundle = NSBundle.mainBundle()
let file = bundle.pathForResource("drumloop", ofType: "wav")
var player = AKAudioPlayer(file!)
player.looping = true

//: Route the audio player through the panner
var panner = AKPanner(player)

audiokit.audioOutput = panner

audiokit.start()
player.play()

//: Adjust the pan to smoothly cycle left and right over time

var t = 0.0
let timeStep = 0.05
AKPlaygroundLoop(every: timeStep) {
    panner.pan
    panner.pan = sin(t)
    t = t + timeStep
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
