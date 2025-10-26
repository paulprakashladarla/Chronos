
import SwiftUI

struct PlanningView: View {
    @EnvironmentObject var bookingData: BookingData

    var body: some View {
        NavigationView {
            List(bookingData.slots) { slot in
                NavigationLink(destination: SlotDetailView(slot: slot)) {
                    SlotRow(slot: slot)
                }
            }
            .navigationTitle("Planning")

            Text("Select a slot")
        }
    }
}

struct PlanningView_Previews: PreviewProvider {
    static var previews: some View {
        PlanningView()
            .environmentObject(BookingData())
    }
}
