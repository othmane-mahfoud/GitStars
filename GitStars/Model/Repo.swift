//
//  Repo.swift
//  GitStars
//
//  Created by Othmane on 5/26/18.
//  Copyright © 2018 Othmane. All rights reserved.
//

import Foundation

class Repo {
    
    var repoName : String
    var repoDescription : String
    var repoOwner : String
    var repoOwnerAvatar : String
    var repoStars : Float
    init(name : String, description : String, owner : String, ownerAvatar : String, stars : Float) {
        repoName = name
        repoDescription = description
        repoOwner = owner
        repoOwnerAvatar = ownerAvatar
        repoStars = stars
    }
    
}
