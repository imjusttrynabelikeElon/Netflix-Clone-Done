//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Karon Bell on 4/25/23.
//

import Foundation


/*
 items =     (
             {
         etag = "2b5bmC6sv8RCkf-UdP8tWZMmU7M";
         id =             {
             kind = "youtube#video";
             videoId = xahxMildR0w;
         };
         kind = "youtube#searchResult";
     },
 */
struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}




struct VideoElement: Codable {
    let id: IdVideoElement
}



struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
