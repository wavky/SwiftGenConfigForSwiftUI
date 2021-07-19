// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen
// Derived from https://github.com/SwiftGen/SwiftGen/issues/685#issuecomment-782893242
// Origin see https://github.com/SwiftGen/SwiftGen/blob/stable/templates/strings/structured-swift5.stencil
//
// Example:
//
//  var body: some View {
//    VStack {
//      Text(L10n.Login.PageTitle.header.key) // return LocalizedStringKey
//      CustomView(string: L10n.Login.Step1.title.text) // return String
//    }
//  }

import SwiftUI

// MARK: - Strings

public enum L10n {
  public enum Avocado {
    /// Avocado Toast
    public static let toast = LocalizedString(table: "Localizable", lookupKey: "Avocado.Toast")
  }
}

// MARK: - Implementation Details
fileprivate func tr(_ table: String, _ key: String, _ locale: Locale = Locale.current, _ args: CVarArg...) -> String {
  let path = Bundle.main.path(forResource: locale.identifier, ofType: "lproj") ?? ""
  let format: String
  if let bundle = Bundle(path: path) {
    format = NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
  } else {
    format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
  }
  return String(format: format, locale: locale, arguments: args)
}

public struct LocalizedString: Hashable {
  let table: String
  fileprivate let lookupKey: String

  init(table: String, lookupKey: String) {
    self.table = table
    self.lookupKey = lookupKey
  }

  var key: LocalizedStringKey {
    LocalizedStringKey(lookupKey)
  }

  var text: String {
    tr(table, lookupKey)
  }

  func text(withLocale locale: Locale) -> String {
    tr(table, lookupKey, locale)
  }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
      return Bundle.module
    #else
      return Bundle(for: BundleToken.self)
    #endif
  }()
}
