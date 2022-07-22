//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by haoshuai on 2022/7/22.
//

import Foundation


var transactionPreviewData = Transaction(id: 1, date: "07/22/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: false, isEdited: false)

var transactionListPreViewData = [Transaction](repeating: transactionPreviewData, count: 10)
