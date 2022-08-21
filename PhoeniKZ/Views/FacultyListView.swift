//
//  ListView.swift
//  PhoeniKZ
//
//  Created by LaptopCartUser on 8/14/22.
//

import SwiftUI

struct FacultyListView: View {
    
    @EnvironmentObject var model: Manager
    @State var selectedCategory: String = "All Faculty"
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                LazyVStack (alignment: .leading) {
                    
                    Divider()
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            // MARK: - Category Buttons
                            ForEach(model.categories) { category in
                                Button {
                                    selectedCategory = category.name
                                } label: {
                                    ZStack {
                                        
                                        Rectangle()
                                            .foregroundColor(Color.white)
                                            .frame(width: 175, height: 40)
                                            .cornerRadius(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.black, lineWidth: 1))
                                        
                                        Text(category.name)
                                            .font(.subheadline.weight(.medium))
                                        
                                    }
                                    .accentColor(.black)
                                    .padding(.vertical, 10)
                                    
                                }
                                .onTapGesture {
                                    category.isSelected.toggle()
                                }
                                
                            }
                            
                        }.padding(.leading)
                        
                    }
                    
                    Divider()
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .padding(.leading, 20)
                    
                }
                
                if selectedCategory == "All Faculty" {
                    
                    Group {
                        
                        VStack (alignment: .leading) {
                            Text("All Faculty")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .padding(.leading, 20)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        ForEach(model.faculty) { faculty in
                            
                            if faculty.category == "Administration" {
                                FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                    .padding(.top)
                            }
                            
                        }
                        
                    }
                    
                    Group {
                        
                        
                        VStack (alignment: .leading) {
                            Text("English")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .padding(.leading, 20)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        Group {
                            
                            ForEach(model.faculty) { faculty in
                                
                                if faculty.category == "English" {
                                    FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                        .padding(.top)
                                }
                                
                            }
                            
                        }
                        
                        VStack (alignment: .leading) {
                            Text("Latin")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .padding(.leading, 20)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        Group {
                            
                            ForEach(model.faculty) { faculty in
                                
                                if faculty.category == "Latin" {
                                    FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                        .padding(.top)
                                }
                                
                            }
                            
                        }
                        
                        
                        VStack (alignment: .leading) {
                            Text("Mathematics")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .padding(.leading, 20)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        Group {
                            
                            ForEach(model.faculty) { faculty in
                                
                                if faculty.category == "Mathematics" {
                                    FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                        .padding(.top)
                                }
                                
                            }
                            
                        }
                        
                        VStack (alignment: .leading) {
                            Text("Physical Education")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .padding(.leading, 20)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        Group {
                            
                            ForEach(model.faculty) { faculty in
                                
                                if faculty.category == "P.E." {
                                    FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                        .padding(.top)
                                }
                                
                            }
                            
                        }
                        
                        VStack (alignment: .leading) {
                            Text("Performing Arts")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .padding(.leading, 20)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        Group {
                            
                            ForEach(model.faculty) { faculty in
                                
                                if faculty.category == "Performing Arts" {
                                    FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                        .padding(.top)
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    Group {
                        
                        VStack (alignment: .leading) {
                            Text("Science")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .padding(.leading, 20)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        Group {
                            
                            ForEach(model.faculty) { faculty in
                                
                                if faculty.category == "Science" {
                                    FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                        .padding(.top)
                                }
                                
                            }
                            
                        }
                        
                        VStack (alignment: .leading) {
                            Text("Social Science")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .padding(.leading, 20)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        Group {
                            
                            ForEach(model.faculty) { faculty in
                                
                                if faculty.category == "Social Science" {
                                    FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                        .padding(.top)
                                }
                                
                            }
                        }
                        
                        VStack (alignment: .leading) {
                            Text("Staff")
                                .font(.title.weight(.semibold))
                                .padding(.horizontal)
                                .padding(.top, 40)
                            
                            Divider()
                                .frame(width: UIScreen.main.bounds.width - 40)
                                .padding(.leading, 20)
                            
                        }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        
                        Group {
                            
                            ForEach(model.faculty) { faculty in
                                
                                if faculty.category == "Staff" {
                                    FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                        .padding(.top)
                                }
                                
                            }
                            
                        }
                    }
                    
                    
                } else {
                    
                    VStack (alignment: .leading) {
                        Text(selectedCategory)
                            .font(.title.weight(.semibold))
                            .padding(.horizontal)
                            .padding(.top, 40)
                        
                        Divider()
                            .frame(width: UIScreen.main.bounds.width - 40)
                            .padding(.leading, 20)
                        
                    }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    
                    Group {
                        
                        ForEach(model.faculty) { faculty in
                            
                            if faculty.category == selectedCategory {
                                FacultyCard(image: faculty.image, name: faculty.name, position: faculty.position, email: faculty.email)
                                    .padding(.top)
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            
        }
        .navigationTitle("Faculty")
    }
}
