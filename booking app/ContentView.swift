
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PlanningView()
                .tabItem {
                    Label("Planning", systemImage: "list.bullet.rectangle")
                }

            BookingView()
                .tabItem {
                    Label("Book", systemImage: "calendar")
                }

            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar.xaxis")
                }
            
            AIAssistantView()
                .tabItem {
                    Label("AI Assistant", systemImage: "message.and.waveform")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
