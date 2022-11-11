
import SwiftUI
struct CartItemRow: View {
    @State var cartItem: BookModel
    @State var num: Int
    var body: some View {
        HStack {
            cartItem.BookImage.resizable().frame(width: 100, height: 100).clipShape(Circle())
            VStack(alignment: .leading) {
                Text(cartItem.title).fontWeight(.semibold)
                Text("\(cartItem.price, specifier: "%.2f")¥ | \(cartItem.publisher)")
                Button("Show details"){}.foregroundColor(.blue)
                
            }
            Spacer()
            Text("\(num)")   }
        
    }
    
}

struct Cart: View {
    @StateObject var vm = ViewModel.vm
    
    
    
    var body: some View {
        
        
        VStack{
            if (!vm.cleared) {
                ForEach(vm.nowUserCart.sorted(by: >), id: \.key) { (item, nnn)
                         in
                        NavigationLink(destination: BookDetail(book: item))
                        {
                            CartItemRow(cartItem:  item, num: nnn)
                            
                        }
                        
                }.padding()
            }

            

            
            Spacer()
            CartSummary(subtotal: vm.getNowUsersTot(), cleared: $vm.cleared)
            HStack{
                Spacer()
                Button(action: {
                    vm.clearCart()
                    
                    print("hey")
                    print(vm.nowUserCart)
                    withAnimation{
                        vm.cleared.toggle()
                    }
                }, label: {
                    Text("Order & Clear Cart")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 100)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                })
                Spacer()
            }
            .padding(.all, 10)
            
            .edgesIgnoringSafeArea(.all)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
        
    }
}

struct CartSummary: View {
    @State var subtotal: Double
    @Binding var cleared: Bool
    var body: some View {
        VStack {
            Button(action: { print("We'll implement promo codes later")      })
            {
                Text("Checkout More").padding()
                
            }
            HStack {
                Text("Summary").bold()
                Spacer()
                VStack {
                    HStack {
                        Text("Subtotal")
                        Spacer()
                        Text(String(format: "¥%.2f", !cleared ? subtotal : 0))
                        
                    }
                    HStack {
                        Text("Taxes")
                        Spacer()
                        Text(String(format: "¥%.2f", !cleared ? subtotal*0.0662 : 0))
                        
                    }
                    HStack {
                        Text("Total")
                        Spacer()
                        Text(String(format: "¥%.2f", !cleared ? subtotal+subtotal*0.0662 : 0))
                    }
                    
                }.frame(width: 200)
                
            }.padding()
            
        }.background(Color.gray.opacity(0.1))
        
    }
    
}
#if DEBUG
struct cartPreviews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
#endif
