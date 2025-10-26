
import SwiftUI

struct BookingView: View {
    @State private var selectedDate = Date()

    let timeSlots = ["10:00 AM", "11:00 AM", "12:00 PM", "01:00 PM", "02:00 PM"]

    var body: some View {
        VStack {
            CalendarView(selectedDate: $selectedDate)
            List(timeSlots, id: \.self) { timeSlot in
                TimeSlotView(timeSlot: timeSlot)
            }
        }
        .navigationTitle("Book a Slot")
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
