//
//  Functions.swift
//  MyLocations
//
//  Created by aleksandar on 5.11.21..
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping() -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: .now() + seconds,
        execute: run)
}

let applicationDocumentDirectory: URL = {
    let paths = FileManager.default.urls(
        for: .documentDirectory,
           in: .userDomainMask)
    return paths[0]
}()

let dataSaveFailedNotification = Notification.Name("DataSaveFailedNotification")

func fatalCoreDataError(_ error: Error) {
    print("***Fatal error: \(error)")
    NotificationCenter.default.post(
        name: dataSaveFailedNotification,
        object: nil)
}
