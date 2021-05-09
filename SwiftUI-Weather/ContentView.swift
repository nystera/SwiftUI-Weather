//
//  ContentView.swift
//  SwiftUI-Weather
//  This is a change
//  Created by Nathan Yeo on 8/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack { // Stacks items in Z axis (back to front)
            // Can only have 10 view at a time (not counting nested)
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack { // Stacks items in V axis (top to bottom)
                Text("Singapore, SG")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                VStack (spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("32°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack (spacing: 20){
                    WeatherDayView(dayOfWeek: "TUES",
                                   imageName: "cloud.sun.fill",
                                   temperature: 28)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 32)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind",
                                   temperature: 24)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 30)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.fill",
                                   temperature: 25)
                }
                Spacer() // Puts empty space to fill the entire space
                // Spacer is consider a VIEW
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold,
                                      design: .default))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
        .frame(width: 60, height: 150)
    }
}
