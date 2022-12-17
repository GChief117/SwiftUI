//
//  RadioView.swift
//  AppleMusic
//
//  Created by Gunnar Beck on 9/14/22.
//
import SwiftUI

struct RadioView: View {
    
    
    @State var radioCovers = RadioModel.covers
    let columns = [GridItem(.flexible())]
    @State var search = ""
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 18){
                HStack{
                    Spacer()
                    Text("Library")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    
                    Spacer(minLength: 0)
                }

                
                if #available(iOS 15.0, *) {
                    HStack(spacing: 15){
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.primary)
                        
                        TextField("Search", text: $search)
                    
                    .searchable(text: $search, placement: .navigationBarDrawer(displayMode:
                            .always) )
                    .onChange(of: search) { index in
                        if !index.isEmpty{
                            radioCovers = RadioModel.covers.filter { $0.title.contains(index) }
                        }
                        else {
                            radioCovers = RadioModel.covers
                        }
                    }
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.primary.opacity(0.06))
                    .cornerRadius(15)
                } else {
                    // Fallback on earlier versions
                }
                //Showcasing the globe and demo icons
                HStack{
                    Spacer()
                    Image(systemName: "globe.americas")
                        .font(.system(size: 80))
                    VStack(alignment: .leading){
                        Text("The Bird Caller App")
                            .font(.title)
                        Text("Demo")
                            .foregroundColor(.gray)
                        
                    }
                    Spacer()
                }
                //Showcasing a grid view for the single station views
                LazyVGrid(columns: columns) {
                    ForEach(radioCovers) { cover in
                        RadioSingleStationView(cover: cover)
                    }
                }
               Rectangle()
                    .fill(.clear)
                    .frame(maxWidth: .infinity, minHeight: 100)
            }
        }
    }


struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
}
