import SwiftUI

@main
struct CallBellApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView() // Display our main view
        }
    }
}import SwiftUI
import os.log // Import for Logger

// Logger instance for debugging (can be placed here or elsewhere depending on scope)
let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "CallBellAppUI")

// Enum to define different types of calls (can also be in its own file)
enum CallType: String {
    case nurse = "NURSE_ASSISTANCE"
    case water = "WATER_REQUEST"
    case pain = "PAIN_MEDICATION"
    // Add other call types as needed
}

// Main view for the application
struct ContentView: View {
    // State variable to show confirmation messages
    @State private var showingConfirmation = false
    @State private var confirmationMessage = ""

    var body: some View {
        // Use a vertical stack to arrange elements
        VStack {
            Spacer() // Pushes content towards the center vertically

            Text("Hospital Call Bell")
                .font(.system(size: 48, weight: .bold)) // Large, bold title
                .padding(.bottom, 50) // Add space below the title

            // --- Call Button ---
            Button {
                logger.info("Call Nurse button tapped")
                // IMPORTANT: This calls the *placeholder* function below
                sendCallBellSignal(type: .nurse)
                showConfirmation("Nurse Call Sent")
            } label: {
                // Use a VStack for icon and text within the button
                VStack {
                    Image(systemName: "bell.fill") // Standard SF Symbol (built-in)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100) // Large icon
                    Text("Call Nurse")
                        .font(.system(size: 36, weight: .medium)) // Large text
                }
                .frame(maxWidth: .infinity, minHeight: 200) // Make button wide and tall
                .padding(40) // Generous padding inside the button
                .background(Color.blue) // Clear background color
                .foregroundColor(.white) // White text/icon
                .cornerRadius(25) // Rounded corners
            }
            .padding(.horizontal, 40) // Padding around the button horizontally

            // --- Optional: Additional Buttons (e.g., Water, Pain) ---
            // Add more buttons here if needed, following the same large-target design
            /*
            Button {
                logger.info("Water request button tapped")
                sendCallBellSignal(type: .water)
                showConfirmation("Water Request Sent")
            } label: {
                VStack {
                    Image(systemName: "drop.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Text("Need Water")
                        .font(.system(size: 36, weight: .medium))
                }
                .frame(maxWidth: .infinity, minHeight: 200)
                .padding(40)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(25)
            }
            .padding(.horizontal, 40)
            .padding(.top, 20) // Space between buttons
            */

            Spacer() // Pushes content towards the center vertically

            // --- Confirmation Message Area ---
            if showingConfirmation {
                Text(confirmationMessage)
                    .font(.title2)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .transition(.opacity.animation(.easeInOut(duration: 0.5))) // Fade in/out
                    .onAppear {
                        // Automatically hide the message after 3 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation { // Optional: Animate the disappearance
                                showingConfirmation = false
                            }
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the screen
        .background(Color(UIColor.systemGroupedBackground)) // Use a standard system background
        .edgesIgnoringSafeArea(.all) // Extend background to screen edges
    }

    // --- Helper Functions ---

    // Function to display the confirmation message
    func showConfirmation(_ message: String) {
        confirmationMessage = message
        showingConfirmation = true
        logger.debug("Showing confirmation: \(message)") // Correct string interpolation
    }

    // --- Placeholder for Call Bell Integration ---
    // !! CRITICAL: This function needs to be replaced with actual code !!
    // It must interact with the specific hospital's call bell system API or hardware.
    func sendCallBellSignal(type: CallType) {
        logger.log("Attempting to send call signal: \(type.rawValue)") // Correct string interpolation

        // ** START OF PLACEHOLDER CODE **
        // This is where the specific integration logic goes.
        // It might involve:
        // - Making a network request (URLSession) to a hospital server API.
        // - Sending data over Bluetooth to a connected relay/device.
        // - Interfacing with a specific SDK provided by the call bell vendor.
        // - Using specific network protocols (e.g., BACnet, proprietary TCP/IP).

        // Example (Conceptual - Won't actually work):
        /*
        guard let url = URL(string: "http://hospital-callbell-system.local/api/call") else {
            logger.error("Invalid API URL")
            showConfirmation("Error: Invalid Configuration")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: String] = ["room": "101", "type": type.rawValue] // Example data
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
             logger.error("Failed to encode request body: \(error.localizedDescription)")
             showConfirmation("Error: Could not prepare call")
             return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    logger.error("Network error sending call: \(error.localizedDescription)")
                    showConfirmation("Error: Could not send call")
                    return
                }
                // Handle successful response (if needed)
                logger.info("Successfully sent call signal via network.")
                // Confirmation is handled by the button action *before* this completes.
                // Consider showing confirmation *after* success here in a real app.
            }
        }
        task.resume()
        */

        // Simulate success for this example - REMOVE THIS IN REAL APP
        print("--- SIMULATING CALL BELL SIGNAL (Placeholder) ---")
        print("Type: \(type.rawValue)") // Correct string interpolation
        print("This is a placeholder. Implement actual connection logic here.")
        print("----------------------------------------------")
        // ** END OF PLACEHOLDER CODE **

        // Note: Confirmation message is shown *immediately* in the button action.
        // In a real app using network calls, you'd likely show confirmation
        // *after* getting a success response from the `sendCallBellSignal` function.
    }
}

// --- Preview Provider ---
// This allows you to see the UI design in Xcode's preview canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}