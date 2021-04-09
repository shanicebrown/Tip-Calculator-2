//
//  ContentView.swift
//  Tip Calculator 2
//
//  Created by Shanice Brown (WHA) on 3/31/21.
//

import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case decimal = "."
    case zero = "0"
    case clear = "CLR"
    
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
        [.one, .two, .three],
        [.four, .five, .six],
        [.seven, .eight, .nine],
        [.decimal, .zero, .clear]
    ]
    
    @State var tip: Double = 0.0
    @State private var isEditing = false
    @State var billAmount: Double = 0.0
    @State var totalBill: Double = 0
    @State var final: Double = 0.0
    
    var body: some View {
        
        VStack {
            
            
            Group{
                Text("Tip Calculator")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: 50.0)
                
                HStack {
                    // Bill before tip Display
                    Text("Bill Amount:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(String(billAmount))
                    
                }
                Spacer()
                    .frame(height: 10.0)
                HStack {
                    Text("Tip \(tip, specifier: "%.0f")%")
                        
                        .fontWeight(.bold)
                    Spacer()
                    Text("0")
                    
                }
                Spacer()
                    .frame(height: 10.0)
                
                Divider()
                HStack {
                    Text("Total:")
                        .fontWeight(.bold)
                    Spacer()
                    Text(String(final))
                    
                }
            }
            
            Spacer()
                .frame(height: 100.0)
            
            Group{
                // THE BUTTONS
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .frame(width: 60, height: 40, alignment: .center)
                                    .background(Color.blue)
                                    .clipShape(Capsule())
                                    .foregroundColor(.white)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
                
            }
            
            Spacer()
                .frame(height: 150.0)
            
            HStack{
                Text("Tip Amount")
                
                Spacer()
                    .frame(height: 50.0)
            }
            
            Slider(
                value: $tip,
                in: 1...100,
                step: 1,
                minimumValueLabel: Text("0%"),
                maximumValueLabel: Text("100%")
                // Text("Tip Amount")
            ) {
                // Text("Tip Amount")
            }
        }
        
        .frame(width: 300, height: 800)
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .clear:
            self.billAmount = 0.0
        case .one:
            self.billAmount = self.billAmount * 10 + 1
        case .two:
            self.billAmount = self.billAmount * 10 + 2
        case .three:
            self.billAmount = self.billAmount * 10 + 3
        case .four:
            self.billAmount = self.billAmount * 10 + 4
        case .five:
            self.billAmount = self.billAmount * 10 + 5
        case .six:
            self.billAmount = self.billAmount * 10 + 6
        case .seven:
            self.billAmount = self.billAmount * 10 + 7
        case .eight:
            self.billAmount = self.billAmount * 10 + 8
        case .nine:
            self.billAmount = self.billAmount * 10 + 9
        case .zero:
            self.billAmount = self.billAmount * 10 + 0
        default:
            ()
            
        }
      calculateTotal()
    }
    
    // Calculate Total Price
    func calculateTotal() {
        final = (billAmount * (tip/100)) + billAmount
       
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
