

import Foundation

class Product {
    var name:String
    var id:String
    var price:Int
    var quantity:Int
    
    init(name: String, id: String, price:Int, quantity:Int) {
        self.id = id
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}

var data = [String:Product]()

func addProduct(){
    print("Nhap ten sản phẩm: ")
    let name = readLine() ?? "Illegal name"
    
    if let check = data[name] {
            print("Sản phẩm đã tồn tại. Vui lòng thêm mới.")
            return
        }
    
    print("Nhập ID: ")
    let id = readLine() ?? "Illegal id"
    print("Nhập giá: ")
    guard let input = readLine(), let price = Int(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    print("Nhập số lượng: ")
    guard let input = readLine(), let quantity = Int(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    
    let product = Product(name: name, id: id, price: price, quantity: quantity)
    data[name] = product
    print("Thêm sản phẩm thành công.")
}


func showAllProducts(){
    for e in data {
        let product = e.value
        print("Tên sản phẩm: \(product.name) - ID: \(product.id) - Giá: \(product.price) - Số lượng: \(product.quantity)")
    }
}

func updateProduct(){
    print("Nhập tên sản phẩm: ")
    let name = readLine() ?? "Illegal name"
    
    guard let product = data[name] else{
            print("Sản phẩm chưa tồn tại. Vui lòng thêm mới.")
            return
        }
    print("Nhập ID: ")
    let id = readLine() ?? "Illegal id"
    print("Nhập giá: ")
    guard let input = readLine(), let price = Int(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    print("Nhập số lượng: ")
    guard let input = readLine(), let quantity = Int(input) else {
        print("Sai định dạng. Vui lòng thực hiện lại")
        return
    }
    
    product.id = id
    product.price = price
    product.quantity = quantity
    print("Cập nhật thành công.")
    
}

func findProductByName(){
    print("Nhập tên sản phẩm cần tìm kiếm: ")
    let name = readLine() ?? "No name"
    
    guard let product = data[name] else{
            print("Sản phẩm chưa tồn tại.")
            return
        }
    print("Sản phẩm: \(product.name) - ID: \(product.id) - Giá: \(product.price) - Số lượng: \(product.quantity)")
}

func mainFunc(){
    while true {
        print("""
            =============================================================
            1. Thêm mới sản phẩm
            2. Cập nhật thông tin sản phẩm
            3. Hiển thị các sản phẩm
            4. Tìm kiếm sản phẩm theo tên
            0. Thoát
            Chọn:
            """)
        
        if let input = readLine(), let number = Int(input) {
            switch number {
            case 1:
                addProduct()
            case 2:
                updateProduct()
            case 3:
                showAllProducts()
            case 4:
                findProductByName()
            case 0:
                return
            default:
                print("Giá trị không hợp lệ. Vui lòng chọn lại.")
            }
        }else{
            print("Giá trị không hợp lệ. Vui lòng chọn lại.")
        }
    }
}
mainFunc()
