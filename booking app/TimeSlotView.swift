
import SwiftUI

struct TimeSlotView: View {
    let timeSlot: String

    var body: some View {
        HStack {
            Text(timeSlot)
                .font(.headline)

            Spacer()

            Button(action: {
                // Book action
            }) {
                Text("Book")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct TimeSlotView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSlotView(timeSlot: "10:00 AM")
    }
}
