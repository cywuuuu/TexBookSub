//
//  Previews.swift
//  SwiftUICharts
//
//  Created by Majid Jabrayilov on 31.05.22.
//
import SwiftUI
import SwiftUICharts

struct upperChart: View {
    let val:[Double]
    var theme: String

    var body: some View {

        let winter = Legend(color: .blue, label: "Winter", order: 4)
        let autumn = Legend(color: .yellow, label: "Autumn", order: 3)
        let summer = Legend(color: .green, label: "Summer", order: 2)
        let spring = Legend(color: .pink, label: "Spring", order: 1)
        
        let points: [DataPoint] = [
            .init(value: val[0], label: "1", legend: spring),
            .init(value: val[1], label: "2", legend: spring),
            .init(value: val[2], label: "3", legend: spring),
            .init(value: val[3], label: "4", legend: summer),
            .init(value: val[4], label: "5", legend: summer),
            .init(value: val[5], label: "6", legend: summer),
            .init(value: val[6], label: "7", legend: autumn),
            .init(value: val[7], label: "8", legend: autumn),
            .init(value: val[8], label: "9", legend: autumn),
            .init(value: val[9], label: "10", legend: winter),
            .init(value: val[10], label: "11", legend: winter),
            .init(value: val[11], label: "12", legend: winter),

        ]

        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    Text("\(theme)").font(.headline).foregroundColor(.secondary)
                    Text("查看不同季度下该类物品\(theme)")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("仅供参考").font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
            }.padding()
            BarChartView(dataPoints: points).clipShape(Rectangle()).shadow(color: Color.gray, radius: 5)
            

            
            
        }
        .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                )
                .padding([.top, .trailing])
                .background(Color.orange.opacity(0.9)).cornerRadius(30)
                .navigationBarTitle(Text("page"), displayMode: .inline)
//                .shadow(color: Color.gray, radius: 1)
    }
}
#if DEBUG
struct upperPreviews: PreviewProvider {
    static var previews: some View {
        upperChart(val: [1,2, 3, 4,5,6,7,8,9, 10, 11, 12], theme: "价格")
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
#endif
