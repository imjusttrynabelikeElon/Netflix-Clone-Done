//
//  Movie.swift
//  Netflix Clone
//
//  Created by Karon Bell on 4/23/23.
//
//
import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
    
}



/*
 {
adult = 0;
"backdrop_path" = "/b9UCfDzwiWw7mIFsIQR9ZJUeh7q.jpg";
"genre_ids" =             (
 10749,
 28,
 35
);
id = 868759;
"media_type" = movie;
"original_language" = en;
"original_title" = Ghosted;
overview = "Salt-of-the-earth Cole falls head over heels for enigmatic Sadie \U2014 but then makes the shocking discovery that she\U2019s a secret agent. Before they can decide on a second date, Cole and Sadie are swept away on an international adventure to save the world.";
popularity = "161.347";
"poster_path" = "/liLN69YgoovHVgmlHJ876PKi5Yi.jpg";
"release_date" = "2023-04-21";
title = Ghosted;
video = 0;
"vote_average" = "7.263";
"vote_count" = 188;
},
 */

