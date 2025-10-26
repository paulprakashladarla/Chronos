
import SwiftUI

struct SlotDetailView: View {
    let slot: Slot

    var body: some View {
        VStack {
            Text(slot.time)
                .font(.largeTitle)
                .padding()

            Text(slot.status)
                .font(.title)
                .foregroundColor(statusColor)
                .padding()

            if let client = slot.client {
                Text(client)
                    .font(.title)
                    .padding()
            }

            Spacer()

            if slot.status == "Available" {
                Button(action: {
                    // Book now action
                }) {
                    Text("Book Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .navigationTitle("Slot Details")
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

struct SlotDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SlotDetailView(slot: Slot(time: "10:00 AM", status: "Available", client: nil))
    }
}
