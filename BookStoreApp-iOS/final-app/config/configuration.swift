//
//  configuration.swift
//  final-app
//
//  Created by sunbeam on 21/07/25.
//

import Foundation

let serverURL = "http://localhost:4000"

func createUrl(path: String)->String{
    return "\(serverURL)/\(path)"
}
