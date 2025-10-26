
import SwiftUI

struct Slot: Identifiable, Hashable {
    let id = UUID()
    var time: String
    var status: String
    var client: String?
}
