import Foundation

struct Project: Codable {
    static func getProjects(from jsonData: Data) throws -> [Project] {
        let response = try JSONDecoder().decode(AirtableResponse.self, from: jsonData)
        return response.projectWrappers.map { $0.project }
    }
    
    let dueDate: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case dueDate = "Due date"
        case name = "Name"
    }
}
