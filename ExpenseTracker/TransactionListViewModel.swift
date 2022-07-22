//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by haoshuai on 2022/7/22.
//

import Foundation
import Combine
import Collections
import OrderedCollections

typealias TransactionGroup = OrderedDictionary<String,[Transaction]>

final class TransactionListViewModel: ObservableObject {
    @Published var transtaions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions() {

        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data  in
                guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions",error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: { [weak self] result in
                self?.transtaions = result
//                dump(self?.transtaions)
            }
            .store(in: &cancellables)
    }
    
    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transtaions.isEmpty else {
            return [:]
        }
        
        let groupTransactions = TransactionGroup(grouping: transtaions) { $0.month }
        return groupTransactions
    }
    
}
