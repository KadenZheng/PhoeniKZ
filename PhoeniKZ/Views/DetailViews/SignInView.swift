//
//  SignInView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/13/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

let db = Firestore.firestore()

struct SignInView: View {
    
    @State var clubSelection: String
    @State var name: String
    @State var code: String
    @State var signInName: String
    @State var image: String
    @State var gradeLevel: String
    
    @EnvironmentObject var model: Manager
    
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
                            Group {
                                
                                Text("ASB").tag("ASB")
                                Text("BSU").tag("BSU")
                                Text("CSF").tag("CSF")
                                Text("Chess Club").tag("Chess Club")
                                Text("Creative Writing").tag("Creative Writing")
                                Text("Debate").tag("Debate")
                                Text("Drama").tag("Drama")
                                Text("D & D").tag("D & D")
                                Text("Earth Club").tag("Earth Club")
                                Text("BSU").tag("BSU")
                                
                            }
                            
                            Group {
                                
                                Text("Finance Club").tag("Finance Club")
                                Text("Food Club").tag("Food Club")
                                Text("GSA").tag("GSA")
                                Text("Interact Club").tag("Interact Club")
                                Text("Journalism Club").tag("Journalism Club")
                                Text("Life Club").tag("Life Club")
                                Text("Multimedia Club").tag("Multimedia Club")
                                Text("Neurodiversity Club").tag("Neurodiversity Club")
                                Text("Peer Mentors").tag("Peer Mentors")
                                Text("Red Cross").tag("Red Cross")
                                
                            }
                            
                            Group {
                                
                                Text("Sailing Club").tag("Sailing Club")
                                Text("Ski").tag("Ski")
                                Text("Speech").tag("Speech")
                                Text("Travel Club").tag("Travel Club")
                                Text("Yearbook").tag("Yearbook")
                                
                            }
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
                
                if clubSelection != "ASC" {
                    
                    VStack {
                        SecureField("Code", text: $code)
                            .padding(.leading, 50)
                        
                        Divider()
                            .frame(width: UIScreen.main.bounds.width - 70)
                            .padding(.top, -5)
                    }
                }
                
                TextField("Grade Level", text: $gradeLevel)
                    .padding(.leading, 50)
                    .padding(.bottom, 5)
                
                Divider()
                    .frame(width: UIScreen.main.bounds.width - 70)
                    .padding(.top, -5)
                
                Spacer()
                
            }
            
            ZStack {
                
                Text(formatDate())
                    .font(.headline.weight(.medium))
                
                Rectangle()
                    .frame(width: 150, height: 40)
                    .foregroundColor(.clear)
                    .border(.black)
                
            }
            .padding(.bottom)
            
            Button {
                
                if name != "" && code != "" && gradeLevel != "" {
                    let club = db.collection(clubSelection)
                    club.document(name).setData(["Name":name, "Code":code, "Grade Level": gradeLevel, "Date":formatDate()])
                }
                
                name = ""
                code = ""
                gradeLevel = ""
                
            } label: {
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
            .accentColor(.black)
            
        }
        .navigationTitle("\(signInName) Sign In")
        
    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView(name: "Kaden", code: "CODE", signInName: "Club", image: "night_school")
//    }
//}
