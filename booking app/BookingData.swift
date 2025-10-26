
import SwiftUI
import Combine

class BookingData: ObservableObject {
    @Published var slots: [Slot] = [
        Slot(time: "10:00 AM", status: "Available", client: nil),
        Slot(time: "11:00 AM", status: "Booked", client: "John Doe"),
        Slot(time: "12:00 PM", status: "Available", client: nil),
        Slot(time: "01:00 PM", status: "Disabled", client: nil),
        Slot(time: "02:00 PM", status: "Booked", client: "Jane Doe"),
    ]
}
