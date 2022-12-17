//
//  TopControlView.swift
//  Tracked
//
//  Created by Zaden Connell on 5/28/22.
//

import SwiftUI

struct TopControlView: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "chevron.left").foregroundColor(.blue)
            Text("Today")
                .bold()
                .foregroundColor(.black)
                .padding()
            Image(systemName: "chevron.right").foregroundColor(.blue)
            Spacer()
        }
        .frame(width: 375)
    }
}

struct TopControlView_Previews: PreviewProvider {
    static var previews: some View {
        TopControlView()
    }
}
