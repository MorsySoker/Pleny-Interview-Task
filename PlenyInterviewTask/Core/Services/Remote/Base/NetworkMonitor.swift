//
//  NetworkMonitor.swift
//  ReachabilityModule
//
//  Created by Mohamed Shiha on 11/24/22.
//

import Foundation
import Network

final public class NetworkMonitor: ObservableObject {
	
	private let monitor = NWPathMonitor()
	private let monitoringQueue = DispatchQueue(label: "Network_Monitor")
	
	@Published var isConnected = true
	
	public init() {
		monitor.pathUpdateHandler = { [weak self] path in
			DispatchQueue.main.async {
				self?.isConnected = path.status == .satisfied
			}
		}
		monitor.start(queue: monitoringQueue)
	}
}
