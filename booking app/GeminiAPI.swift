import Foundation

// This is a dummy implementation of the Gemini API.
// Replace this with your actual API call.

func make_gemini_request(prompt: String, completion: @escaping (String) -> Void) {
    // Dummy response for booking
    if prompt.lowercased().contains("book") {
        completion("Sure, I can book a slot for you. What time?")
    } 
    // Dummy response for cancellation
    else if prompt.lowercased().contains("cancel") {
        completion("Sure, I can cancel a booking for you. What time?")
    }
    // Dummy response for showing available slots
    else if prompt.lowercased().contains("show available") {
        completion("Sure, I can show you the available slots.")
    }
    // Dummy response for showing booked slots
    else if prompt.lowercased().contains("show bookings") {
        completion("Sure, I can show you your bookings.")
    }
    // Generic dummy response
    else {
        completion("I'm sorry, I'm a demo AI and my capabilities are limited. I can help with booking, canceling, and showing slots.")
    }
}