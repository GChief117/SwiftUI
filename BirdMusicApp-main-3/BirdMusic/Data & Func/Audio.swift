//
//  Audio.swift
//  AppleMusic
//
//  Created by Gunnar Beck on 9/13/22.
//
/*
 This is where we have our AudioPlayer, with the playing sound function
 So therefore, our given audio will play when slecting a given file
 To its specific path
 */
import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath : path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file")
        }
    }
}
func stopSound() {
    audioPlayer?.stop()
}
