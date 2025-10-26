
import SwiftUI

struct MetricCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
            Text(value)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct MetricCard_Previews: PreviewProvider {
    static var previews: some View {
        MetricCard(title: "Bookings", value: "12")
    }
}
