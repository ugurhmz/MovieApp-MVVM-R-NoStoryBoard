//
//  Animator.swift
//  ChallengeApp
//
//  Created by ugur-pc on 4.05.2022.
//


import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
