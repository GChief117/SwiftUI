//
//  SubscriptionProcess.swift
//  Subscription
//
//  Created by Gunnar Beck on 12/16/22.
//

import Foundation
import SwiftUI
import StoreKit
/*
struct SubscriptionPaywallView: View {
    // MARK: - Properties

    @State private var isLoading = false
    @State private var isError = false

    // MARK: - Body

    var body: some View {
        VStack {
            if isLoading {
                // Display a loading indicator while the payment is being processed.
                ActivityIndicator(isAnimating: $isLoading, style: .large)
            } else if isError {
                // Display an error message if there was an issue with the payment.
                Text("An error occurred. Please try again.")
            } else {
                // Display the subscription paywall button.
                Button(action: purchaseSubscription) {
                    Text("Unlock premium content")
                }
            }
        }
    }
    
    

    // MARK: - Methods

    private func purchaseSubscription() {
        isLoading = true

        // Add the subscription product to the payment queue.
        let payment = SKPayment(product: subscriptionProduct)
        SKPaymentQueue.default().add(payment)
    }
}

extension SubscriptionPaywallView: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                // The payment is being processed.
                break
            case .purchased:
                // The payment was successful. Unlock the premium content.
                unlockPremiumContent()
                SKPaymentQueue.default().finishTransaction(transaction)
            case .failed:
                // The payment failed. Show an error message.
                isLoading = false
                isError = true
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                // The subscription was restored from a previous purchase. Unlock the premium content.
                unlockPremiumContent() 
                SKPaymentQueue.default().finishTransaction(transaction)
            case .deferred:
                // The payment is deferred.
                break
            @unknown default:
                // An unknown transaction state was encountered.
                break
            }
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        // The transactions were removed from the payment queue.
    }

    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        // The restore operation failed. Show an error message.
        isLoading = false
        isError = true
    }
}



class SubscriptionPaywall: ObservableObject, SKPaymentTransactionObserver {
    func displaySubscriptionPaywall() {
        // Retrieve the subscription product from the App Store
        let productIdentifier = "YOUR_SUBSCRIPTION_PRODUCT_ID"
        let request = SKProductsRequest(productIdentifiers: Set([productIdentifier]))
        request.delegate = self
        request.start()
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first {
            // Add the subscription product to the payment queue
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                // The payment is being processed
                break
            case .purchased:
                // The payment was successful, unlock the content
                unlockContent()
                SKPaymentQueue.default().finishTransaction(transaction)
            case .failed:
                // The payment failed, show an error message
                showErrorMessage()
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                // The payment was restored, unlock the content
                unlockContent()
                SKPaymentQueue.default().finishTransaction(transaction)
            case .deferred:
                // The payment is on hold, show a message to the user
                showDeferredMessage()
            @unknown default:
                break
            }
        }
    }

    func paymentQueue(_ queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        // Handle transactions that have been removed from the payment queue
    }

    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        // Handle errors when restoring completed transactions
    }

    func unlockContent() {
        // Unlock the content for the user
    }

    func showErrorMessage() {
        // Show an error message to the user
    }

    func showDeferredMessage() {
        // Show a message to the user that the payment is on hold
    }
}



struct SubscriptionView: View, SKPaymentTransactionObserver {
    // Other view properties

    var body: some View {
        Button(action: {
            // Add the in-app purchase to the payment queue
            let payment = SKPayment(product: self.subscriptionProduct)
            SKPaymentQueue.default().add(payment)

            // Set the view as the transaction observer
            SKPaymentQueue.default().add(self)
        }) {
            Text("Subscribe")
        }
    }

    // MARK: - SKPaymentTransactionObserver

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                // Unlock the subscription content for the user
                unlockSubscriptionContent()

                // Finish the transaction
                queue.finishTransaction(transaction)
            case .failed:
                // Show an error message to the user
                showErrorMessage()

                // Finish the transaction
                queue.finishTransaction(transaction)
            default:
                break
            }
        }
    }
}

*/
