
import SwiftUI

struct DashboardView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("This Week")
                        .font(.title)
                        .padding()

                    LazyVGrid(columns: columns, spacing: 20) {
                        MetricCard(title: "Bookings", value: "12")
                        MetricCard(title: "Revenue", value: "$1,200")
                        MetricCard(title: "Cancellations", value: "3")
                        MetricCard(title: "New Clients", value: "5")
                    }
                    .padding()

                    Text("Booking Trends")
                        .font(.title)
                        .padding()

                    ChartView()
                        .padding()
                }
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
