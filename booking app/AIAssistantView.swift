
import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct AIAssistantView: View {
    @EnvironmentObject var bookingData: BookingData
    @State private var messages: [Message] = [
        Message(text: "Hello! How can I help you today?", isUser: false)
    ]
    @State private var showingSlotListForBooking = false
    @State private var showingSlotListForCancellation = false

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(messages) { message in
                            HStack {
                                if message.isUser {
                                    Spacer()
                                    Text(message.text)
                                        .padding(10)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                } else {
                                    Text(message.text)
                                        .padding(10)
                                        .background(Color(.systemGray5))
                                        .cornerRadius(10)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }

                if showingSlotListForBooking {
                    slotList(forBooking: true)
                } else if showingSlotListForCancellation {
                    slotList(forBooking: false)
                } else {
                    commandMenu
                }
            }
            .navigationTitle("AI Assistant")
        }
    }

    private var commandMenu: some View {
        VStack {
            Button("Book a slot") {
                messages.append(Message(text: "Book a slot", isUser: true))
                showingSlotListForBooking = true
            }
            .padding()

            Button("Cancel a booking") {
                messages.append(Message(text: "Cancel a booking", isUser: true))
                showingSlotListForCancellation = true
            }
            .padding()

            Button("Show available slots") {
                messages.append(Message(text: "Show available slots", isUser: true))
                showAvailableSlots()
            }
            .padding()

            Button("Show my bookings") {
                messages.append(Message(text: "Show my bookings", isUser: true))
                showBookedSlots()
            }
            .padding()
        }
    }

    private func slotList(forBooking: Bool) -> some View {
        let slots = forBooking ? bookingData.slots.filter { $0.status == "Available" } : bookingData.slots.filter { $0.status == "Booked" }
        
        return VStack {
            if slots.isEmpty {
                Text(forBooking ? "No available slots." : "No bookings to cancel.")
            } else {
                List(slots) { slot in
                    Button(action: {
                        if forBooking {
                            bookSlot(at: slot.time)
                        } else {
                            cancelSlot(at: slot.time)
                        }
                        showingSlotListForBooking = false
                        showingSlotListForCancellation = false
                    }) {
                        Text(slot.time)
                    }
                }
            }
            
            Button("Back to menu") {
                showingSlotListForBooking = false
                showingSlotListForCancellation = false
            }
            .padding()
        }
    }
    
    private func bookSlot(at time: String) {
        if let index = bookingData.slots.firstIndex(where: { $0.time == time }) {
            bookingData.slots[index].status = "Booked"
            bookingData.slots[index].client = "User"
            let response = "I have booked the slot at \(time) for you."
            messages.append(Message(text: response, isUser: false))
        } else {
            let response = "I'm sorry, I couldn't find a slot at that time."
            messages.append(Message(text: response, isUser: false))
        }
    }
    
    private func cancelSlot(at time: String) {
        if let index = bookingData.slots.firstIndex(where: { $0.time == time }) {
            bookingData.slots[index].status = "Available"
            bookingData.slots[index].client = nil
            let response = "I have canceled the booking at \(time)."
            messages.append(Message(text: response, isUser: false))
        } else {
            let response = "I'm sorry, I couldn't find a slot at that time."
            messages.append(Message(text: response, isUser: false))
        }
    }
    
    private func showAvailableSlots() {
        let availableSlots = bookingData.slots.filter { $0.status == "Available" }
        if availableSlots.isEmpty {
            messages.append(Message(text: "There are no available slots.", isUser: false))
        } else {
            let slotList = availableSlots.map { $0.time }.joined(separator: ", ")
            let response = "The following slots are available: \(slotList)"
            messages.append(Message(text: response, isUser: false))
        }
    }
    
    private func showBookedSlots() {
        let bookedSlots = bookingData.slots.filter { $0.status == "Booked" }
        if bookedSlots.isEmpty {
            messages.append(Message(text: "There are no booked slots.", isUser: false))
        } else {
            let slotList = bookedSlots.map { "\($0.time) by \($0.client ?? "Unknown")" }.joined(separator: ", ")
            let response = "The following slots are booked: \(slotList)"
            messages.append(Message(text: response, isUser: false))
        }
    }
}

struct AIAssistantView_Previews: PreviewProvider {
    static var previews: some View {
        AIAssistantView()
            .environmentObject(BookingData())
    }
}
