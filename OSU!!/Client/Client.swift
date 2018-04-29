////
////  Client.swift
////  OSU!!
////
////  Created by 直井翔汰 on 2018/04/29.
////  Copyright © 2018年 直井翔汰. All rights reserved.
////
//
//import Foundation
//
////postmessageResult
//enum Result<T1> {
//    case success(T1)
//    case error
//}
//
////TODO: clent作成しようね
//public protocol FitbitClient {
//    var baseUrl: String { get }
//    
//    associatedtype Response
//    associatedtype ErrorModel
//    var path: String { get }
//    var method: HTTPMethod { get }
//    var parameters: [String : Any]? { get }
//    var header: [String : String]? { get }
//    
//    func response(from object: Data) throws -> Self.Response
//    func responseError(from object: Data) throws -> Self.ErrorModel
//}
//
//
//public extension FitbitClient {
//    var baseUrl: String {
//        return "https://api.fitbit.com"
//    }
//    
//    func request(finished: @escaping (Result<Self.Response, Self.ErrorModel>)->Void) {
//        guard let url = URL(string: baseUrl + path) else { return }
//        var request: URLRequest = URLRequest(url: url)
//        request.httpMethod = method.rawValue
//        if let parameters = parameters {
//            do {
//                let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
//                request.httpBodyStream = InputStream.init(data: data)
//            } catch {
//                finished(Result.failed(error))
//                return
//            }
//        }
//        
//        if let header = header {
//            header.forEach() {
//                request.addValue($0.value, forHTTPHeaderField: $0.key)
//            }
//        }
//        
//        let session = URLSession.shared
//        session.dataTask(with: request) {
//            data, responce, error in
//            print(String(data: data ?? Data(), encoding: .utf8) ?? "")
//            DispatchQueue.main.async {
//                if let error = error {
//                    finished(Result.failed(error))
//                } else if let data = data {
//                    do {
//                        print(data)
//                        finished(Result.success(try self.response(from: data)))
//                    } catch {
//                        do {
//                            finished(Result.error(try self.responseError(from: data)))
//                        } catch {
//                            finished(Result.failed(error))
//                        }
//                    }
//                }
//            }
//            }.resume()
//    }
//}
//
//// MARK: - ResponseがDecodableの場合
//public extension FitbitClient where Response: Decodable {
//    func response(from object: Data) throws -> Self.Response {
//        return try JSONDecoder().decode(Response.self, from: object)
//    }
//}
//
//public extension FitbitClient where ErrorModel: Decodable {
//    func responseError(from object: Data) throws -> Self.ErrorModel {
//        return try JSONDecoder().decode(ErrorModel.self, from: object)
//    }
//}
