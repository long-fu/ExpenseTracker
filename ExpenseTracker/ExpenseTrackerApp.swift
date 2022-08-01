//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by haoshuai on 2022/7/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    
    // 关键字需要注意
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
