//
//  RadioSingleStationView.swift
//  AppleMusic
//
//  Created by Gunnar Beck on 9/14/22.
//


import SwiftUI
import AVFoundation


/*
 This is where the single view for the radio station of birds is displaying, with the functionality of the list
 
 
 */
struct RadioSingleStationView: View {
    
    
    //play audio and audio player
    @State var playAudio = true
    @State private var playing: Bool = false
    @State var audioPlayer: AVAudioPlayer!
    
    let cover: RadioModel
    
    //Counter for how many times played
    //and counts how many times an audio is played
    @State var counter: Int = 0

    var body: some View {
        HStack {
            
            Button(action: {
                if playAudio {
                    playSound(sound: cover.soundGarden, type: "mp3")
                    playSound(sound: cover.soundGarden, type: "mp3")
                    playSound(sound: cover.soundGarden, type: "mp3")
                    self.counter += 1
                } else {
                    stopSound()
                }
                playAudio.toggle()
            }, label: {
                Image(cover.imageSqr)
                .resizable()
                .scaledToFit()
                .frame(width: 100,
                       height: 100)
                .cornerRadius(10)
                    
            VStack(alignment: .leading) {
                Text(cover.title)
                    .font(.title2)
                    .foregroundColor(.white)
                Text(cover.location)
                    .foregroundColor(.secondary)
                    Divider()
                    .offset(y: 17)
                
            }
                VStack(alignment: .trailing){
                        Text("\(counter)")
                        .foregroundColor(.white)
                        .font(.title)
                }
            
        })
            Spacer()
        }
        .padding(.leading, 5)
        
    }
}

struct RadioSingleStationView_Previews: PreviewProvider {
    static var previews: some View {
        RadioSingleStationView(cover: RadioModel.covers[0]).previewLayout(.sizeThatFits)
    }
}
