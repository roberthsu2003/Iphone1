import Foundation

class DataSource{
    static func copyFilesToDocuments(){
        //取得mainBundle內,citys.db的絕對路徑
        let sourceURL = Bundle.main.url(forResource: "citys", withExtension: "db")
        
        let targetURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        print(targetURLs)
    }
}
