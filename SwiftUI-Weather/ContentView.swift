//
//  ContentView.swift
//  SwiftUI-Weather
//  This is a change
//  Created by Nathan Yeo on 8/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack { // Stacks items in Z axis (back to front)
            // Can only have 10 VIEW at a time (not counting nested)
            BackGroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Singapore, SG")
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 30)
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
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
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

struct BackGroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body : some View {
            Text(cityName)
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.white)
                .padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack (spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
