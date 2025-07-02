import Foundation
import AppKit
import Combine

class ActiveAppMonitor: ObservableObject {
    @Published var currentAppName: String = "Unknown"
    
    private var timer: Timer?
    
    init() {
        startAppPolling()
    }
    
    private func startAppPolling() {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.updateCurrentApp()
            }
            self.updateCurrentApp()
        }
    }
    
    private func updateCurrentApp() {
        DispatchQueue.main.async {
            self.currentAppName = NSWorkspace.shared.frontmostApplication?.localizedName ?? "Unknown"
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}
