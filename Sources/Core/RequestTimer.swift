//
//  RequestTimer.swift
//  SnapsureSDK
//
//  Created by Nikita Ermolenko on 11/03/2017.
//  Copyright © 2017 Snapsure. All rights reserved.
//

import Foundation

// TODO: Remove public later

public final class RequestTimer {
    
    private var intervalsTimer: Timer?
    private var isOverTimer: Timer?
    
    private let maxTime: TimeInterval
    private let intervals: [TimeInterval]
    private var currentIndexInterval = 0
    
    public var timeIsOverHandler: (() -> Void)?
    public var nextIntervalHandler: ((RequestTimer) -> Void)?
    
    deinit {
        print("timer deinit")
    }
    
    init(maxTime: TimeInterval, intervals: [TimeInterval]) {
        self.maxTime = maxTime
        self.intervals = intervals
    }
    
    // MARK: Timer actions
    
    public func start() {
        startIntervalsTimer()
        startIsOverTimer()
    }
    
    public func `continue`() {
        currentIndexInterval += 1
        startIntervalsTimer()
    }

    public func stop() {
        intervalsTimer?.invalidate()
        isOverTimer?.invalidate()
        
        intervalsTimer = nil
        isOverTimer = nil
    }
    
    // MARK: Helpers
    
    private func startIntervalsTimer() {
        intervalsTimer = Timer(timeInterval: intervals[currentIndexInterval],
                               target: self,
                               selector: #selector(intervalTimerTriggered),
                               userInfo: nil,
                               repeats: false)
        RunLoop.current.add(intervalsTimer!, forMode: .defaultRunLoopMode)
    }
    
    private func startIsOverTimer() {
        isOverTimer = Timer(timeInterval: maxTime,
                            target: self,
                            selector: #selector(overTimerTriggered),
                            userInfo: nil,
                            repeats: false)
        RunLoop.current.add(isOverTimer!, forMode: .defaultRunLoopMode)
    }
    
    // MARK: Selector actions
    
    @objc private func intervalTimerTriggered() {
        intervalsTimer?.invalidate()
        intervalsTimer = nil
        nextIntervalHandler?(self)
    }
    
    @objc private func overTimerTriggered() {
        intervalsTimer?.invalidate()
        intervalsTimer = nil
        timeIsOverHandler?()
    }
}

public extension RequestTimer {
    
    static var `default` = RequestTimer(maxTime: 60, intervals: [10, 6, 6, 6, 6, 6, 6, 6, 6, 6])
}
