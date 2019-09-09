struct AirtableResponse: Codable {
    let projectWrappers: [ProjectWrapper]
    
    enum CodingKeys: String, CodingKey {
        case projectWrappers = "records"
    }
}
