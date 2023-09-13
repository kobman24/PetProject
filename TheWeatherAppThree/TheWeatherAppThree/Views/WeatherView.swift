
import Foundation
import SwiftUI


struct WeatherView: View {
    let dateFormatter = DateFormatter()
    
    var cityName: String
    var temp: Double
    var pressure: Int
    var humidity: Int
    
    var body: some View {
        
        
        ZStack(alignment: .leading){
            
            VStack{
                VStack(alignment: .leading) {
                    
                    Text(cityName)
                        .bold()
                        .font(.system(size: 40))
                        .padding()
                    Text("Сегодня:  \(Date().formatted(.dateTime.day().month().hour().minute()))")
                        .fontWeight(.light)
                        .font(.system(size: 25))
                        .padding()
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                VStack(alignment: .leading){
                    
                    Text("Температура: \(temp, specifier: "%.0f") °C ")
                        .font(.system(size: 40))
                        .padding()
                    AsyncImage(url: URL(string: "https://fons.pibig.info/uploads/posts/2023-05/1685151829_fons-pibig-info-p-gorod-minimalizm-krasivii-fon-5.jpg")) { image in image
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .scaledToFit()
                            .padding()
                        
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    HStack(alignment: .top){
                        VStack{
                            Text("Давление : \(pressure)" )
                                .padding()
                            Image(systemName: "rectangle.compress.vertical")
                                .font(.system(size: 30))
                        }
                        VStack{
                            Text("Влажность : \(humidity) %")
                                .padding()
                            Image(systemName: "humidity")
                                .font(.system(size: 30))
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxWidth: .infinity)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(red: 0.026, green: 0.12, blue: 0.67))
                .background(.white)
                .cornerRadius(20, antialiased: true)
                
                
            }
            
            
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(red: 0.026, green: 0.12, blue: 0.67))
        .preferredColorScheme(.dark)
     
    }
}
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(cityName: "Тбилиси", temp: 33.00, pressure: 133, humidity: 133)
    }
}
