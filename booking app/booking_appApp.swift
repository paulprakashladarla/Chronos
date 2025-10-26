
import SwiftUI

@main
struct booking_appApp: App {
    @StateObject private var bookingData = BookingData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bookingData)
        }
    }
}
