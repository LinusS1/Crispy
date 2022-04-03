import Foundation
import Combine

@MainActor class CrispyViewModel: ObservableObject {
    @Published var links: [Link] = []
    
    init() { }
    
    func refreshLinks() async {
        let communicationService = CommunicationsService(apiHost: URL(string: UserDefaults.standard.string(forKey: "prefs.url") ?? "")!, token: UserDefaults.standard.string(forKey: "prefs.token") ?? "")
        links = try! await communicationService.listAllLinks()
    }
}
