//
//  BaseObservableViewModel.swift
//  SalamTak-DR
//
//  Created by Korashi on 16/11/2022.
//

import Combine

class BaseObservableViewModel: ObservableObject {
    
    @Published public var networkMonitor = NetworkMonitor()
    @Published public var isLoading: Bool = false
    @Published public var showsError: Bool = false
    @Published public var showConnectionError: Bool = false
    @Published public var errorMessage: String = ""
    @Published public var connectionMessage: String = ""
    public var cancellables: Set<AnyCancellable> = []
    
    init() {
        bindError()
        bindConnectionError()
        checkConnection()
    }
    
    private func checkConnection() {
        networkMonitor.$isConnected
            .sink { [weak self] isConnected in
                print("IsConnected: \(isConnected)")
                self?.connectionMessage = isConnected ? "" : "Connection_Error"
            }
            .store(in: &cancellables)
    }
    
    private func bindConnectionError() {
        $connectionMessage
            .map { !$0.isEmpty }
            .assign(to: \.showConnectionError, on: self)
            .store(in: &cancellables)
    }
    
    private func bindError() {
        $errorMessage
            .map { !$0.isEmpty }
            .assign(to: \.showsError, on: self)
            .store(in: &cancellables)
    }
    
    func onReceive(_ comletion: Subscribers.Completion<NetworkError>) {
        if case let .failure(error) = comletion {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}
