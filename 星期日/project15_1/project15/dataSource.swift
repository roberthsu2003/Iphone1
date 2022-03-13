import Foundation


class DataSource{
    static var targetURLs:URL?
    
    
    static let singleton:DataSource = {        
        copyFilesToDocuments()
        return DataSource()
    }()
    
    var cities:[City]{
        
        let sql = "SELECT * FROM city"
        
        return [City]()
                
        
    }
    
    func searchCity(searchString:String) -> [City]{
        
        let sql = """
            SELECT * FROM city
            WHERE cityName like ? OR continent like ? OR country like ? OR description like ?
            """
        
        return [City]()
    }
    
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
        
        
    }
    
    deinit{
        
    }
    
    
}
