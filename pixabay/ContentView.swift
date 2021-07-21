//
//  ContentView.swift
//  pixabay
//
//  Created by Akshaya Kumar N on 11/22/20.
//

import SwiftUI
import SDWebImageSwiftUI


let namArray = ["nature","food","fashion","science","education","feelings","health","animal","sports"]
//images that i imported
let imgArray = ["a","b","c","d1","e1","f1","g1","h1","i1"]

let gardient = Gradient(colors: [.white,.accentColor,.primary])
let linGrad = LinearGradient(gradient:gardient, startPoint: .top, endPoint: .bottom)
struct ContentView: View {
    
    @State  var selectedType = namArray[0]
    @ObservedObject var imagedwnld = dwnldimage()
    
    var body: some View {
        
        ZStack
        {
            
            ScrollView
            {
                
                VStack
                {
                    Text("PixaBay")
                        .font(.custom("Bradley Hand", size: 40))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    
                    
                }.padding(.top,40)
                ScrollView(.horizontal,showsIndicators:false)
                {
                    HStack
                    {
                        ForEach(0..<namArray.count)
                        {
                            
                            index in
                            
                            Button(action: { selectedType = namArray[index]
                                categ = selectedType
                                imagedwnld.model.removeAll()
                                imagedwnld.downloadImages(categ: selectedType)
                                
                            }, label: {
                                VStack
                                {
                                    Image(imgArray[index])
                                        .resizable()
                                        .shadow(radius: 5 )
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        .frame(width:100,height:100)
                                    
                                    Text(namArray[index])
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .padding()
                                        .foregroundColor(selectedType == namArray[index] ?.white:.gray)
                                    
                                    if selectedType == namArray[index]
                                    {
                                        
                                        Capsule()
                                            .fill(Color.black)
                                            .frame(width:80,height:2)
                                    }
                                    
                                }
                                
                                
                            })
                            
                            
                        }
                        
                    }}
                
                ZStack() {
                    ScrollView{
                        ForEach(0..<20)
                        {
                            
                            imgindex in
                            
                            
                            ForEach(imagedwnld.model)
                            {
                                image in
                                LazyVGrid(columns:[GridItem()], spacing: 5)
                                {
                                    let index = image.img[imgindex]
                                    
                                    
                                    WebImage(url: URL(string:image.img[imgindex]))
                                        .resizable()
                                        .placeholder(Image(systemName: "photo"))
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:UIScreen.main.bounds.width - 22,height:250)
                                        .cornerRadius(12)
                                }}}
                        
                        .background(Color.primary)
                        
                    }
                    
                    
                    
                }
                
                
                
                
            }.background(linGrad)
            .ignoresSafeArea()
        }}}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
