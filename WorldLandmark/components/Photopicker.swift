import SwiftUI
import PhotoLibraryPicker // Add import

struct photoPicker : View {
    @State var showActionSheet: Bool = false
    @State var pictures = [Picture]()
    
    var body: some View {
        VStack {
            Button(action: {self.showActionSheet.toggle()}) {
                Image(systemName: "plus")
                    .padding()
                    .background(Color.secondary)
                    .mask(Circle())
            }.sheet(isPresented: self.$showActionSheet) {PhotoLibraryPicker(self.$pictures)}
            List {
                ForEach(pictures) { picture in
                    picture.toImage() // You can fix the size by default width: 100, height: 100
                }
            }
        }
    }
}


struct ntentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            photoPicker()
        }
        
    }
}
