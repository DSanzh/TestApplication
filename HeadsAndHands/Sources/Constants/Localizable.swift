//
//  Localizable.swift
//  HeadsAndHands
//
//  Created by Sanzh on 6/10/19.
//  Copyright © 2019 D Sanzhar. All rights reserved.
//

import Foundation

internal enum L10n {
    
    internal enum Login {
        /// Почта
        internal static let email = L10n.tr("Localizable", "Login.Email")
        /// Пароль
        internal static let password = L10n.tr("Localizable", "Login.Password")
        /// Забыли пароль?
        internal static let forgotPassword = L10n.tr("Localizable", "Login.ForgotPassword")
        /// Войти
        internal static let enter = L10n.tr("Localizable", "Login.Enter")
        /// У меня еще нет аккаунта. Создать.
        internal static let loginNotExits = L10n.tr("Localizable", "Login.LoginNotExist")
        /// Авторизация
        internal static let title = L10n.tr("Localizable", "Login.Title")
    }
    internal enum Welcome {
        /// Добро пожаловать
        internal static let main = L10n.tr("Localizable", "Welcome.Main")
    }
    internal enum Common {
        /// Далее
        internal static let next = L10n.tr("Localizable", "Common.Next")
    }
}

extension L10n {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        // swiftlint:disable:next nslocalizedstring_key
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {}
