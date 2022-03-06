import Foundation

class DataSource{
    static func copyFilesToDocuments(){
        let sourceURL = Bundle.main.url(forResource: "citys", withExtension: "db")
        print(sourceURL?.path)
    }
}
