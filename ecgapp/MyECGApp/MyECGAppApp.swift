//
//  MyECGAppApp.swift
//  MyECGApp
//
//  Created by Pavan Tatikonda on 5/23/24.
//

//import UIKit
//import HealthKit
//
//class ViewController: UIViewController {
//
//    let healthStore = HKHealthStore()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        requestHealthKitAuthorization()
//    }
//
//    func requestHealthKitAuthorization() {
//        guard HKHealthStore.isHealthDataAvailable() else {
//            print("Health data not available")
//            return
//        }
//
//        let ecgType = HKObjectType.electrocardiogramType()
//        let typesToRead: Set<HKObjectType> = [ecgType]
//
//        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
//            if success {
//                print("Authorization succeeded")
//                self.fetchECGData { ecgSamples, error in
//                    if let ecgSamples = ecgSamples {
//                        print("Fetched ECG data: \(ecgSamples)")
//                        for ecgSample in ecgSamples {
//                            self.fetchECGDataPoints(ecgSample: ecgSample)
//                        }
//                    } else if let error = error {
//                        print("Error fetching ECG data: \(error.localizedDescription)")
//                    }
//                }
//            } else {
//                if let error = error {
//                    print("Authorization failed: \(error.localizedDescription)")
//                } else {
//                    print("Authorization failed")
//                }
//            }
//        }
//    }
//
//    func fetchECGData(completion: @escaping ([HKElectrocardiogram]?, Error?) -> Void) {
//        let ecgType = HKObjectType.electrocardiogramType()
//
//        let query = HKSampleQuery(sampleType: ecgType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, samples, error in
//            guard let samples = samples as? [HKElectrocardiogram] else {
//                completion(nil, error)
//                return
//            }
//            completion(samples, nil)
//        }
//        healthStore.execute(query)
//    }
//
//    func fetchECGDataPoints(ecgSample: HKElectrocardiogram) {
//        let query = HKElectrocardiogramQuery(ecgSample) { (query, result) in
//            switch result {
//            case .measurement(let measurement):
//                if let leadIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
//                    let leadIValue = leadIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
//                    print("Lead I Voltage: \(leadIValue) mV")
//                }
//                if let leadIIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
//                    let leadIIValue = leadIIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
//                    print("Lead II Voltage: \(leadIIValue) mV")
//                }
//                if let leadIIIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
//                    let leadIIIValue = leadIIIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
//                    print("Lead III Voltage: \(leadIIIValue) mV")
//                }
//                // Repeat for other leads if needed
//            case .done:
//                print("Finished retrieving all data points")
//            case .error(let error):
//                print("Error retrieving data points: \(error.localizedDescription)")
//            @unknown default:
//                fatalError("Unknown case in ECG query result")
//            }
//        }
//        healthStore.execute(query)
//    }
//}
//import UIKit
//import HealthKit
//
//class ViewController: UIViewController {
//    let healthStore = HKHealthStore()
//    let ecgLabel = UILabel() // Add a UILabel to display ECG data
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .white
//        ecgLabel.frame = CGRect(x: 20, y: 50, width: 300, height: 500)
//        ecgLabel.numberOfLines = 0
//        view.addSubview(ecgLabel)
//        
//        requestHealthKitAuthorization()
//    }
//
//    func requestHealthKitAuthorization() {
//        guard HKHealthStore.isHealthDataAvailable() else {
//            print("Health data not available")
//            return
//        }
//
//        let ecgType = HKObjectType.electrocardiogramType()
//        let typesToRead: Set<HKObjectType> = [ecgType]
//
//        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
//            if success {
//                print("Authorization succeeded")
//                self.fetchECGData { ecgSamples, error in
//                    if let ecgSamples = ecgSamples {
//                        print("Fetched ECG data: \(ecgSamples)")
//                        for ecgSample in ecgSamples {
//                            self.fetchECGDataPoints(ecgSample: ecgSample)
//                        }
//                    } else if let error = error {
//                        print("Error fetching ECG data: \(error.localizedDescription)")
//                    }
//                }
//            } else {
//                if let error = error {
//                    print("Authorization failed: \(error.localizedDescription)")
//                } else {
//                    print("Authorization failed")
//                }
//            }
//        }
//    }
//
//    func fetchECGData(completion: @escaping ([HKElectrocardiogram]?, Error?) -> Void) {
//        let ecgType = HKObjectType.electrocardiogramType()
//
//        let query = HKSampleQuery(sampleType: ecgType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, samples, error in
//            guard let samples = samples as? [HKElectrocardiogram] else {
//                completion(nil, error)
//                return
//            }
//            completion(samples, nil)
//        }
//        healthStore.execute(query)
//    }
//
//    func fetchECGDataPoints(ecgSample: HKElectrocardiogram) {
//        let query = HKElectrocardiogramQuery(ecgSample) { (query, result) in
//            switch result {
//            case .measurement(let measurement):
//                var ecgDataString = ""
//                if let leadIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
//                    let leadIValue = leadIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
//                    ecgDataString += "Lead I Voltage: \(leadIValue) mV\n"
//                }
//                if let leadIIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
//                    let leadIIValue = leadIIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
//                    ecgDataString += "Lead II Voltage: \(leadIIValue) mV\n"
//                }
//                if let leadIIIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
//                    let leadIIIValue = leadIIIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
//                    ecgDataString += "Lead III Voltage: \(leadIIIValue) mV\n"
//                }
//                DispatchQueue.main.async {
//                    self.ecgLabel.text = ecgDataString
//                }
//            case .done:
//                print("Finished retrieving all data points")
//            case .error(let error):
//                print("Error retrieving data points: \(error.localizedDescription)")
//            @unknown default:
//                fatalError("Unknown case in ECG query result")
//            }
//        }
//        healthStore.execute(query)
//    }
//}
import UIKit
import HealthKit

class ViewController: UIViewController {
    let healthStore = HKHealthStore()
    let ecgLabel = UILabel() // Add a UILabel to display ECG data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        ecgLabel.frame = CGRect(x: 20, y: 50, width: 300, height: 500)
        ecgLabel.numberOfLines = 0
        view.addSubview(ecgLabel)
        
        requestHealthKitAuthorization()
    }
    
    func requestHealthKitAuthorization() {
        guard HKHealthStore.isHealthDataAvailable() else {
            print("Health data not available")
            return
        }
        
        let ecgType = HKObjectType.electrocardiogramType()
        let typesToRead: Set<HKObjectType> = [ecgType]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if success {
                print("Authorization succeeded")
                self.fetchECGData { ecgSamples, error in
                    if let ecgSamples = ecgSamples {
                        print("Fetched ECG data: \(ecgSamples)")
                        for ecgSample in ecgSamples {
                            self.fetchECGDataPoints(ecgSample: ecgSample)
                        }
                    } else if let error = error {
                        print("Error fetching ECG data: \(error.localizedDescription)")
                    }
                }
            } else {
                if let error = error {
                    print("Authorization failed: \(error.localizedDescription)")
                } else {
                    print("Authorization failed")
                }
            }
        }
    }
    
    func fetchECGData(completion: @escaping ([HKElectrocardiogram]?, Error?) -> Void) {
        let ecgType = HKObjectType.electrocardiogramType()
        
        let query = HKSampleQuery(sampleType: ecgType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, samples, error in
            guard let samples = samples as? [HKElectrocardiogram] else {
                completion(nil, error)
                return
            }
            completion(samples, nil)
        }
        healthStore.execute(query)
    }
    
    //    func fetchECGDataPoints(ecgSample: HKElectrocardiogram) {
    //        let query = HKElectrocardiogramQuery(ecgSample) { (query, result) in
    //            switch result {
    //            case .measurement(let measurement):
    //                var ecgDataString = ""
    //                if let leadIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
    //                    let leadIValue = leadIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
    //                    ecgDataString += "Lead I Voltage: \(leadIValue) mV\n"
    //                }
    //                if let leadIIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
    //                    let leadIIValue = leadIIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
    //                    ecgDataString += "Lead II Voltage: \(leadIIValue) mV\n"
    //                }
    //                if let leadIIIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
    //                    let leadIIIValue = leadIIIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
    //                    ecgDataString += "Lead III Voltage: \(leadIIIValue) mV\n"
    //                }
    //                DispatchQueue.main.async {
    //                    self.ecgLabel.text = ecgDataString
    //                }
    //            case .done:
    //                print("Finished retrieving all data points")
    //            case .error(let error):
    //                print("Error retrieving data points: \(error.localizedDescription)")
    //            @unknown default:
    //                fatalError("Unknown case in ECG query result")
    //            }
    //        }
    //        healthStore.execute(query)
    //    }
    //}
    func fetchECGDataPoints(ecgSample: HKElectrocardiogram) {
        let query = HKElectrocardiogramQuery(ecgSample) { (query, result) in
            switch result {
            case .measurement(let measurement):
                var ecgDataString = ""
                if let leadIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
                    let leadIValue = leadIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
                    ecgDataString += "Lead I Voltage: \(leadIValue) mV\n"
                }
//                if let leadIIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
//                    let leadIIValue = leadIIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
//                    ecgDataString += "Lead II Voltage: \(leadIIValue) mV\n"
//                }
//                if let leadIIIQuantity = measurement.quantity(for: .appleWatchSimilarToLeadI) {
//                    let leadIIIValue = leadIIIQuantity.doubleValue(for: HKUnit.voltUnit(with: .milli))
//                    ecgDataString += "Lead III Voltage: \(leadIIIValue) mV\n"
//                }
                DispatchQueue.main.async {
                    self.ecgLabel.text = ecgDataString
                }
            case .done:
                print("Finished retrieving all data points")
            case .error(let error):
                print("Error retrieving data points: \(error.localizedDescription)")
            @unknown default:
                fatalError("Unknown case in ECG query result")
            }
        }
        healthStore.execute(query)
    }
}
