//
//  AlamofireView.swift
//  URLSession_Alamfire
//
//  Created by 어재선 on 9/26/24.
//

import SwiftUI

struct AlamofireView: View {
    @ObservedObject var networking = networkingClass()
    let url = "https://randomuser.me/api/?results=50&inc=name,email"
    
    init() {
        networking.alamofireNetworking(url: url)
    }
    
    var body: some View {
        List(networking.randomUser) { datas in
            ListView(datas)
        }
    }
}
