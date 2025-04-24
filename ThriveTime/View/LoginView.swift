//
//  LoginView.swift
//  ThriveTime
//
//  Created by Shehara Jayasooriya on 2025-04-11.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject  var viewModel = LoginViewModel()
    
    
    var body: some View {
        
        VStack(spacing: 14){
            
            Text("Welcome!")
            // .font(.custom("Afacad", size: 40))
                .font(.largeTitle)
                //.font(<#T##font: Font?##Font?#>)
            //change font type
                .bold()
            
            Text("Login to your account")
                .font(.title3)
               // .padding(.bottom, 20)
            //.foregroundColor(.gray)
            
            
           // VStack{
                HStack {
                    HStack{
                        ZStack{
                            
                            Circle()
                                .fill(Color.white)
                                .frame(width: 70, height: 70)
                                .shadow(radius: 5)
                            
                            Image(systemName: "person.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 30))
                            // .padding(10)
                            //.background(Color.white)
                            // .cornerRadius(10)
                            //.shadow(radius: 5)
                            // .frame(width: 4, height: 4)
                            //.padding(.horizontal,20)
                        }
                        //.offset(x: -1, y: -2)
                    }
                   
                   .offset(x: -1, y: -3)
                  //  .offset(y: -40)
                            
                    TextField("Email", text: $viewModel.email)
                        .padding()
                    // .background(Color.gray.opacity(0.2))
                        .background(Color.white)
                        .cornerRadius(12)
                    //.padding(.top,30)
                        .shadow(radius: 5)
                        .frame(width: 250, height: 60)
                    // .padding()
                    // .padding(.leading, 20)
                }
                .offset(x: -10,y: -40)
                .padding(.top, 50)
         //   }
            
            
            
            
            
            
            HStack{
                
                Image(systemName: "lock.fill")
                    .foregroundColor(.gray)
            
                SecureField("*********", text: $viewModel.password)
                    .padding(12)
                    .background(Color.white)
                    //.background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .frame(width: 280, height: 60)
                //.padding(38)
                
                
            }
//            
//            Text("Password")
//                .font(.title2)
            
            
            
            
            
            Button(action:
                    {
                viewModel.login()
                
            })
            {
                Text(viewModel.isLoading ? "Logging in..." : "Login")
                    .foregroundColor(.white)
                    .frame(width: 240, height: 23)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(18)
            }
            .disabled(viewModel.isLoading)
            //.padding(.bottom, 13)
        }
        
        Button(action: {
            // Handle forgot password action
        }) {
            Text("Forgot password?")
                .foregroundColor(.black)
        }
        .padding(.bottom, 50)
        
    }
     //   Spacer()
    

        
    
//       .padding(20)
//        .alert(isPresented: .constant(viewModel.errorMessage != nil))
//    {
//        Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
//    }
//    
//    
    
  }
//}
            

    


#Preview {
    LoginView()
}
