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
        
        ZStack {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.black)
                .background(Color.black)
            
            VStack (alignment: .center) {
                
                Spacer()
                
                // MARK: - Sign In Navigation Title
                
                if clubSelection == "ASC" {
                    Text("\(formatDate()) ASC Sign In")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical)
                } else {
                    Text("\(formatDate()) Sign In")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical)
                }
                
                Group {
                    
                    // MARK: - Image
                    
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.vertical)
                    
                    // MARK: - Title Text
                    
                    if signInName != "ASC" {
                        HStack (alignment: .center) {
                            
                            // MARK: - Club Picker
                            
                            Text("Select Your Club:")
                                .font(.headline.weight(.medium))
                                .foregroundColor(.white)
                            
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
                                .accentColor(.white)
                                
                                
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
                                .accentColor(.white)
                                
                                Group {
                                    
                                    Text("Sailing Club").tag("Sailing Club")
                                    Text("Ski").tag("Ski")
                                    Text("Speech").tag("Speech")
                                    Text("Travel Club").tag("Travel Club")
                                    Text("Yearbook").tag("Yearbook")
                                    
                                }
                                .accentColor(.white)
                            }.foregroundColor(.white)
                                .background(Color.clear)
                                .accentColor(.white)
                        }
                    } else {
                        HStack (alignment: .center) {
                            
                            Text("Academic Support Center")
                                .font(.headline.weight(.medium))
                                .foregroundColor(.black)
                            
                        }
                        .accentColor(.black)
                    }
                }
                
                Spacer()
                
                // MARK: - Text Fields
                Group {
                    
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)
                        .padding(.bottom, 5)
                    
                    Divider()
                        .overlay(.gray)
                        .frame(width: UIScreen.main.bounds.width - 70)
                        .padding(.top, -5)
                        
                    if clubSelection != "ASC" {
                        
                        VStack {
                            SecureField("Code", text: $code)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal, 50)
                                .padding(.bottom, 5)
                            
                            Divider()
                                .overlay(.gray)
                                .frame(width: UIScreen.main.bounds.width - 70)
                                .padding(.top, -5)
                        }
                    }
                    
                    TextField("Grade Level", text: $gradeLevel)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 50)
                        .padding(.bottom, 5)
                        
                    Divider()
                        .overlay(.gray)
                        .frame(width: UIScreen.main.bounds.width - 70)
                        .padding(.top, -5)
                        
                    
                    Spacer()
                    
                }
                
//                ZStack {
//
//                    Text(formatDate())
//                        .font(.headline.weight(.medium))
//                        .foregroundColor(.white)
//
//                    Rectangle()
//                        .frame(width: 150, height: 40)
//                        .foregroundColor(.clear)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 5)
//                                .stroke(Color.white, lineWidth: 1.5))
//
//                }
//                .padding(.bottom)
                
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
                        
                        Rectangle()
                            .frame(width: 250, height: 50)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1.5))
                        
                        Text("Submit")
                            .font(.headline.weight(.medium))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 80)
                    
                }
                
                Spacer()
                
            }
            .edgesIgnoringSafeArea(.top)
            
        }
        

    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView(name: "Kaden", code: "CODE", signInName: "Club", image: "night_school")
//    }
//}
