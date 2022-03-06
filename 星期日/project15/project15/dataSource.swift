import Foundation
import SQLite3

class DataSource{
    static var targetURLs:URL?
    static var conn:OpaquePointer!
    
    static func copyFilesToDocuments(){
        //取得mainBundle內,citys.db的絕對路徑
        let sourceURL = Bundle.main.url(forResource: "citys", withExtension: "db")
        
        let targetURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        self.targetURLs = targetURLs.appendingPathComponent("citys.db")
        
        if !FileManager.default.fileExists(atPath: self.targetURLs!.path){
            do{
                try FileManager.default.copyItem(at: sourceURL!, to: self.targetURLs!)
            }catch{
                print("複制檔案出錯了")
                return
            }
            print("複制檔案成功")
            
        }
    }
}
