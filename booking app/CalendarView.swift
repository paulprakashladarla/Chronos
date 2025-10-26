
import SwiftUI

struct CalendarView: View {
    @Binding var selectedDate: Date

    var body: some View {
        DatePicker(
            "Select a date",
            selection: $selectedDate,
            displayedComponents: .date
        )
        .datePickerStyle(.graphical)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDate: .constant(Date()))
    }
}
