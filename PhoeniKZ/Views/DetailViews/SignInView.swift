//
//  SignInView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/13/22.
//

import SwiftUI

struct SignInView: View {
    
    @State var clubSelection: String?
    @State var name: String
    @State var code: String
    @State var signInName: String
    @State var image: String
    
    var body: some View {
        
        VStack (alignment: .center) {
            
            Spacer()
            
            Group {
                
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom)
                
                if signInName != "ASC" {
                    HStack (alignment: .center) {
                        
                        Text("Select Your Club:")
                            .font(.headline.weight(.medium))
                        
                        Picker("Select Your Club", selection: $clubSelection) {
                            Text("ASB").tag("ASB")
                            Text("Pre-Med").tag("Pre-Med")
                            Text("BSU").tag("BSU")
                        }
                        .accentColor(.black)
                    }
                } else {
                    HStack (alignment: .center) {
                        
                        Text("Academic Support Center")
                            .font(.headline.weight(.medium))
                        
                    }
                    .accentColor(.black)
                }
            }
            
            Spacer()
            
            Group {
                
                TextField("Name", text: $name)
                    .padding(.leading, 50)
                    .padding(.bottom, 5)
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width - 70)
                    .padding(.top, -5)
                
                SecureField("Code", text: $code)
                    .padding(.leading, 50)
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width - 70)
                    .padding(.top, -5)
            }
            
            Spacer()
            
            ZStack {
                
                Text(formatDate())
                    .font(.headline.weight(.medium))
                
                Rectangle()
                    .frame(width: 150, height: 40)
                    .foregroundColor(.clear)
                    .border(.black)
                
            }
            .padding(.bottom)
            
            ZStack {
                
                Text("Submit")
                    .font(.headline.weight(.medium))
                
                Rectangle()
                    .frame(width: 250, height: 50)
                    .foregroundColor(.clear)
                    .border(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1.5))
            }
            
        }
        .navigationTitle("\(signInName) Sign In")
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(name: "Kaden", code: "CODE", signInName: "Club", image: "night_school")
    }
}
