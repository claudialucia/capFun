//
//  ContentView.swift
//  capFun
//
//  Created by Claudia Ortiz on 9/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var userText = ""
    @State var capMode = 1
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            if capMode == 1 {
                Text(userText.uppercased())
                    .font(.largeTitle)
            }else if capMode == 2 {
                Text(userText.capitalized)
                    .font(.largeTitle)
            }else{
                Text(userText.lowercased())
                    .font(.largeTitle)
            }
            
            Spacer()
            
            Button(action: {
                if capMode == 1 {
                    UIPasteboard.general.string = userText.uppercased()
                }else if capMode == 2 {
                    UIPasteboard.general.string = userText.capitalized
                }else{
                    UIPasteboard.general.string = userText.lowercased()
                }
                
                }){
                RoundedButton(title: "Copiar", color: .blue)}
            HStack {
                Button(action: {capMode = 1}){
                    RoundedButton(title: "CAPS", color: .orange)}
                Button(action: {capMode = 2}){
                    RoundedButton(title: "First letter", color: .green)}
                Button(action: {capMode = 3}){
                    RoundedButton(title: "lower case", color: .red)}
            }
            
            TextField("Enter a text here...",text : $userText)
                .padding()
        } .padding()
    }
    
    struct RoundedButton: View{
        var title: String
        var color: Color
        
        var body: some View{
            Text(title)
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(color)
                .font(.body)
                .foregroundColor(.white)
                .cornerRadius(15)
            
            
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
