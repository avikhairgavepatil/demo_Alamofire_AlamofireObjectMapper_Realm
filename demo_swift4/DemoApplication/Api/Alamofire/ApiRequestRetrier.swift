//
//  ApiRequestRetrier.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This request retrier is injected into Alamofire and is used
 to determine if a failing request should be retried.
 
 It saves all requests that fail with a 401 in a retry queue,
 then performs a token refresh. If this refresh succeeds, it
 retries all queued requests, otherwise it causes all queued
 requests to fail, then clears the queue.
 
 If you are new to HTTP status codes, a 401 status indicates
 that a request failed because it is not properly authorized.
 If your request actually provided an auth token, this means
 that the auth token is invalid and must be refreshed.
 
 A very common way to perform a token refresh, is to have an
 auth token with a short valid time and a refresh token with
 a longer valid time. If the auth token becomes invalid, the
 refresh token can be used to request new tokens, whenever a
 request fails with a 401 (since the request should be valid).
 If this request also fails with a 401, both tokens are dead
 and the user should be considered to be logged out.
 
 However, in this demo, which communicates with a static api
 without any real auth logic, we will fake a failing request
 by calling a non-existing resource and cause a 404 response,
 which we will use ONLY in this retrier class. In a real app,
 replace 404 with 401.
 
 */

import Alamofire

class ApiRequestRetrier: RequestRetrier {
    
    
    // MARK: - Initialization
    
    init(context: ApiContext, authService: AuthService, statusCodeTrigger: Int = 404 /* 401 */) {
        self.context = context
        self.authService = authService
        self.statusCodeTrigger = statusCodeTrigger
    }
    
    
    // MARK: - Dependencies
    
    private let authService: AuthService
    private var context: ApiContext
    private let statusCodeTrigger: Int
    
    
    // MARK: - Properties
    private var isAuthorizing = false
    private var retryQueue = [RequestRetryCompletion]()
    
    
    // MARK: - RequestRetrier
    
    func should(
        _ manager: SessionManager,
        retry request: Request,
        with error: Error,
        completion: @escaping RequestRetryCompletion) {
        
        guard
            shouldRetryRequest(with: request.request?.url),
            shouldRetryResponse(with: request.response?.statusCode)
            else { return completion(false, 0) }
        
        authorize(with: completion)
    }
}


// MARK: - Private Functions

private extension ApiRequestRetrier {
    
    func authorize(with completion: @escaping RequestRetryCompletion) {
        print("Authorizing application...")
        retryQueue.append(completion)
        guard !isAuthorizing else { return }
        isAuthorizing = true
        authService.authorize { (token, error) in
            self.isAuthorizing = false
            self.printAuthResult(token, error)
            self.context.authToken = token
            let success = token != nil
            self.retryQueue.forEach { $0(success, 0) }
            self.retryQueue.removeAll()
        }
    }
    
    func printAuthResult(_ token: String?, _ error: Error?) {
        if let error = error {
            return print("Authorizing failed: \(error.localizedDescription)")
        }
        if let token = token {
            return print("Authorizing succeded: \(token)")
        }
        print("No token received - failing!")
    }
    
    func shouldRetryRequest(with url: URL?) -> Bool {
        guard let url = url?.absoluteString else { return false }
        let authPath = ApiRoute.auth.path
        return !url.contains(authPath)
    }
    
    func shouldRetryResponse(with statusCode: Int?) -> Bool {
        return statusCode == statusCodeTrigger
    }
}
