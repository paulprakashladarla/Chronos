
import SwiftUI
import Charts

struct BookingTrend: Identifiable {
    let id = UUID()
    let day: String
    let bookings: Int
}

struct ChartView: View {
    let data: [BookingTrend] = [
        .init(day: "Mon", bookings: 10),
        .init(day: "Tue", bookings: 15),
        .init(day: "Wed", bookings: 7),
        .init(day: "Thu", bookings: 12),
        .init(day: "Fri", bookings: 20),
        .init(day: "Sat", bookings: 25),
        .init(day: "Sun", bookings: 18),
    ]

    var body: some View {
        Chart(data) {
            BarMark(
                x: .value("Day", $0.day),
                y: .value("Bookings", $0.bookings)
            )
        }
        .frame(height: 200)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
