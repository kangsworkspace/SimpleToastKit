# 🥪 SimpleToastKit
<img src="https://github.com/user-attachments/assets/bad504cd-5fff-40f1-89e0-982bb09c0dca" width="300" height="300" />

[![Swift](https://img.shields.io/badge/Swift-5.9_5.10_6.0-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.9_5.10_6.0-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_15+-yellowgreen?style=flat-square)](...)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-Compatible-blue?style=flat-square)](...)

> **The simplest way to show toast view in your SwiftUI project.**
  
# 👀 At a glance 
**Show the toast view like this:**

- **1. When using a custom view**
  
  Trigger the toast view by accessing `STK.shared` and calling the `showToastView` function.  
Pass your custom view inside the closure.  

```swift
import SimpleToastKit

var body: some View {
    VStack {
        Button {
            STK.shared.showToastView(holdSec: 1.0, animationStyle: .scaledFade, animated: true) {
                YourCustomView()
            }
        } label: {
            Text("Show Toast View")
        }
    }
    .toastable() // to the root view you want to show the toast on.
}
```

  
# 🛠 How to use

## Common  
1. **Import SimpleToastKit**

At the top of your SwiftUI view, import the package:

```swift
import SimpleToastKit
```

2. **Apply `.toastable()`**

Apply `.toastable()` to the **root view** you want to show the toast on.  

```swift
VStack {
    // Your content here
}
.toastable()
```

  
## When using a custom view

Trigger the toast view by accessing `STK.shared` and calling the `showToastView` function. 

### Parameters

- **holdSec**: The number of seconds the toast view remains visible.
- **animationStyle**: The animation style used for presenting and dismissing the toast.
- **animated**: A Boolean value indicating whether to animate the appearance and disappearance.
- **content**: A view builder closure that provides the custom content for the toast.

```swift
Button {
    STK.shared.showToastView(holdSec: 1.0, animationStyle: .scaledFade, animated: true) {
        YourCustomView()
    }
} label: {
    Text("Show Toast View")
}
```

You can also use the simplified method by omitting the parameters.  

```swift
Button {
    STK.shared.showToastView {
        YourCustomView()
    }
} label: {
    Text("Show Toast View")
}
```


# 📦 Installation

SimpleToastKit supports installation via [Swift Package Manager](https://swift.org/package-manager).

Add the following to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/kangsworkspace/SimpleToastKit", from: "1.0.0")
]
```

And add "SimpleToastKit" to your target dependencies:

```swift
.target(
    name: "YourTargetName",
    dependencies: [
        "SimpleToastKit"
    ]
)
```


# 📃 License
**SimpleToastKit** is under MIT license. See the [LICENSE](LICENSE) file for more info.
