//
//  RadioRectangleStationView.swift
//  AppleMusic
//
//  Created by Gunnar Beck on 9/14/22.
//

/*
 
 Here we are establishing our layout for the names of the birds we will add to our station of sounds
 
 */
import SwiftUI

struct RadioRectangleStantionView: View {

    let covers: RadioModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(covers.title)
                .font(.title3)
                .padding(.bottom, 2)
        }
        .padding(.leading, 5)
    }
}

struct RadioRectangleStantionView_Previews: PreviewProvider {
    static var previews: some View {
        RadioRectangleStantionView(covers: RadioModel.covers[0]).previewLayout(.sizeThatFits)
    }
}
