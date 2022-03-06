import Foundation

class DataSource{
    static func copyFilesToDocuments(){
        //取得mainBundle內,citys.db的絕對路徑
        let sourceURL = Bundle.main.url(forResource: "citys", withExtension: "db")
        
        var targetURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        targetURLs = targetURLs.appendingPathComponent("citys.db")
        
        if !FileManager.default.fileExists(atPath: targetURLs.path){
            do{
                try FileManager.default.copyItem(at: sourceURL!, to: targetURLs)
            }catch{
                print("複制檔案出錯了")
                return
            }
            print("複制檔案成功")
            
        }
    }
}
