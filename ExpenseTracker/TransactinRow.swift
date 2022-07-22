//
//  TransactinRow.swift
//  ExpenseTracker
//
//  Created by haoshuai on 2022/7/22.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactinRow: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            
            //
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width:44,height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                //
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                //
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                //
                Text(transaction.dateParsed,format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }
            
            Spacer()
            
            //
            
            Text(transaction.signeAmount,format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
            
        }
        .padding([.top,.bottom], 8)
    }
}

struct TransactinRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactinRow(transaction: transactionPreviewData)
        TransactinRow(transaction: transactionPreviewData)
            .preferredColorScheme(.dark)
    }
}
