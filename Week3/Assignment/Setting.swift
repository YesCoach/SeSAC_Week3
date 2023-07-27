//
//  Setting.swift
//  Week3
//
//  Created by 박태현 on 2023/07/27.
//

import Foundation

enum Setting: Int, CaseIterable {

    static let cellIdentifer: String = "SettingCellIdentifier"

    case whole
    case personal
    case etc

    var description: String {
        switch self {
        case .whole: return "전체 설정"
        case .personal: return "개인 설정"
        case .etc: return "기타"
        }
    }

    var count: Int {
        switch self {
        case .whole: return Whole.allCases.count
        case .personal: return Personal.allCases.count
        case .etc: return Etc.allCases.count
        }
    }
}

extension Setting {
    enum Whole: Int, CaseIterable {
        case announcement
        case lab
        case versionInfo

        var description: String {
            switch self {
            case .announcement: return "공지사항"
            case .lab: return "실험실"
            case .versionInfo: return "버전 정보"
            }
        }
    }

    enum Personal: Int, CaseIterable {
        case security
        case alarm
        case chat
        case multiProfile

        var description: String {
            switch self {
            case .security: return "개인/보안"
            case .alarm: return "알림"
            case .chat: return "채팅"
            case .multiProfile: return "멀티프로필"
            }
        }
    }

    enum Etc: Int, CaseIterable {
        case help

        var description: String {
            switch self {
            case .help: return "고객센터/도움말"
            }
        }
    }
}
