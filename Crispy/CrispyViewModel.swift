import Foundation
import Combine

@MainActor class CrispyViewModel: ObservableObject {
    @Published var links: [Link] = []
    
    let communicationService = CommunicationsService(apiHost: URL(string: UserDefaults.standard.string(forKey: "prefs.url") ?? "")!, token: UserDefaults.standard.string(forKey: "prefs.token") ?? "")
    
    init() { }
    
    func refreshLinks() async {
        links = try! await communicationService.listAllLinks()
    }
    
    func newLink(name: String, destination: String) {
        let linkUpload = LinkUpload(name: name, url: destination)
        let jsonEncoder = JSONEncoder()
        let encodedJSON = try! jsonEncoder.encode(linkUpload)
        
        Task {
            try! await communicationService.newLink(withData: encodedJSON)
            await refreshLinks()
        }
    }
    
    private struct LinkUpload: Encodable {
        var name: String
        var url: String
    }
}
