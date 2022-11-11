//
//  uploadForm.swift
//  WorldLandmark
//
//  Created by cyw on 2022/10/21.
//
import SwiftUI


struct uploadForm: View {
    // 用户名
    @State private var showingAlert = false
    @State var bookname: String = ""
    @State var className: String = ""
    @State var author: String = ""
    @State var tot: Int = 0
    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    var previewOptions = ["材料科学与工程学院"
                          ,
                          "电子信息工程学院"
                          ,
                          "自动化科学与电气工程学院"
                          ,
                          "能源与动力工程学院"
                          ,
                          "航空科学与工程学院"
                          ,
                          "计算机学院"
                          ,
                          "机械工程及自动化学院"
                          ,
                          "经济管理学院"
                          ,
                          "理学院"
                          ,
                          "生物工程系"
                          ,
                          "人文社会科学学院 (公共管理学院)"
                          ,
                          "外国语学院"
                          ,
                          "交通科学与工程学院"
                          ,
                          "工程系统工程系"
                          ,
                          "宇航学院"
                          ,
                          "飞行学院"
                          ,
                          "仪器科学与光电工程学院"
                          ,
                          "软件学院"
                          ,
                          "法学院"
                          ,
                          "高等工程学院" ]
    
    var body: some View {
        //        NavigationView {
        Form {
            Section(header: Text("PROFILE")) {
                TextField("书籍名称", text: $bookname)
                TextField("对应课程", text: $className)
                TextField("作者", text: $author)
                
                Toggle(isOn: $isPrivate) {
                    Text("Private Account")
                }
            }
            
            
            
            
            Section(header: Text("Publish Amount")) {
                TextField("发布数量",value:$tot,format: .number)
                Toggle(isOn: $notificationsEnabled) {
                    Text("Publish to Open Market?")
                }
                
                
            }
            Section(header: Text("Single Price")) {
                TextField("单价",value:$tot,format: .number)
                
                
            }
            Section(header: Text("SUITED COLLEGE")) {
                Picker(selection: $previewIndex, label: Text("Select Suitable College")) {
                    ForEach(0 ..< previewOptions.count) {
                        Text(self.previewOptions[$0])
                    }
                }.pickerStyle(.menu)
                
            }
            
            Section(){
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Text("Reset All Settings")
                }
                
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Text("Submit")
                }.foregroundColor(.red).alert(isPresented: $showingAlert) {
                    Alert(title: Text("Hello SwiftUI!"),
                          message: Text("This is some detail message"),
                          dismissButton: .default(Text("OK")))
                }
            }
            //            }
            //            .navigationBarTitle("To Publish")
        }
    }
}

struct uppPreView: PreviewProvider {
    static var previews: some View {
        uploadForm()
    }
}
