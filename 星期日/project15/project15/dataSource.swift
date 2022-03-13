import Foundation
import SQLite3

class DataSource{
    static var targetURLs:URL?
    static var conn:OpaquePointer!
    
    static let singleton:DataSource = {        
        copyFilesToDocuments()
        return DataSource()
    }()
    
    static func copyFilesToDocuments(){
        //取得mainBundle內,citys.db的絕對路徑
        let sourceURL = Bundle.main.url(forResource: "citys", withExtension: "db")
        
        let targetURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        self.targetURLs = targetURLs.appendingPathComponent("citys.db")
        
        print(targetURLs.path)
        
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
    
    static func createConn(){
        if conn == nil{
            if sqlite3_open(targetURLs!.path, &conn) == SQLITE_OK{
                print("資料庫開啟成功")
            }else{
                print("資料庫開啟失敗")
            }
        }
        
    }
    
    func getAllCityData(){
        DataSource.createConn()
        let sql = "SELECT * FROM city"
        var statement:OpaquePointer!
        if sqlite3_prepare_v2(DataSource.conn, sql, -1, &statement, nil) == SQLITE_OK{
            print("statement實體建立成功")
        }
    }
}
