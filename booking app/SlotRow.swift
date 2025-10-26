
import SwiftUI

struct SlotRow: View {
    let slot: Slot

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(slot.time)
                    .font(.headline)
                if let client = slot.client {
                    Text(client)
                        .font(.subheadline)
                }
            }

            Spacer()

            Text(slot.status)
                .font(.subheadline)
                .foregroundColor(statusColor)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }

    private var statusColor: Color {
        switch slot.status {
        case "Available":
            return Color("StatusGreen")
        case "Booked":
            return Color("StatusOrange")
        default:
            return Color("StatusGray")
        }
    }
}

struct SlotRow_Previews: PreviewProvider {
    static var previews: some View {
        SlotRow(slot: Slot(time: "10:00 AM", status: "Available", client: nil))
    }
}
