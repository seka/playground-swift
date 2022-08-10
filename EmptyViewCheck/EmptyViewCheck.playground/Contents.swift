import SwiftUI

print(isEmptyView(Text("test")))
print(isEmptyView(EmptyView()))
print(isEmptyView(ForEach(0..<[].count, id: \.self) { _ in }))
print(isEmptyView(ForEach([String](), id: \.self) { _ in }))

private func isEmptyView(_ view: Any) -> Bool {
    // if 文で省略された View は型の一番外側に Optional がつき、nilになる
    if case Optional<Any>.none = view {
        return true
    }
    let mirror = Mirror(reflecting: view)
    if mirror.subjectType == EmptyView.self {
        return true
    }
    // ForEachをindexで使用した場合
    if let range = mirror.descendant("data") as? CountableRange<Int>, range == 0 ..< 0 {
        return true
    }
    // ForEachにArrayを指定した場合
    if let array = mirror.descendant("data") as? [Any], array.isEmpty {
        return true
    }
    return false
}
