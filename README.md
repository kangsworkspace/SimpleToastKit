# 🥪 SimpleToastKit
<img src="https://github.com/user-attachments/assets/bad504cd-5fff-40f1-89e0-982bb09c0dca" width="300" height="300" />

[![Swift](https://img.shields.io/badge/Swift-5.9_5.10_6.0-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.9_5.10_6.0-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_15+-yellowgreen?style=flat-square)](...)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-Compatible-blue?style=flat-square)](...)

> **The simplest way to show toast view in your SwiftUI project.**
  
  
# 📒 Latest Release Note (2.2.4)
### Added
- Add padding option to SimpleToast. (2025-05-13)  
  This option was added because the toast view was positioned directly above the tab bar,  
  which made it necessary to provide a padding option.
  
- Add alignment option to SimpleToast & custom toastview. (2025-05-14)  
  This option was added to support cases where the toast view needs to appear in the middle or at the top of the screen.  
  
### Fixed
- Slide bottom animation now dismisses correctly. (2025-05-11)  
  A bug where the toast view disappeared with a fade animation instead of sliding back to the bottom has been resolved.
  
### Changed
- Improved feedback for repeated button taps. (2025-05-18)  
  When the button is tapped rapidly or repeatedly, the toast view now disappears and reappears more smoothly, making the transition feel more natural.


# 👀 At a glance 
**Show the toast view like this:**

- **1. When using a custom view**
  
 Trigger the toast view by accessing `STK.toast` and calling the `show` function.  
Pass your custom view inside the closure.  

```swift
import SimpleToastKit

var body: some View {
    VStack {
        Button {
            STK.toast.show(holdSec: 1.0, animationStyle: .scaledFade) {
                YourCustomView()
            }
        } label: {
            Text("Show Toast View")
        }
    }
    .toastable() // to the root view you want to show the toast on.
}
```

<br/>

- **2. When using simple toast views**
  
  Trigger the simple toast view by accessing `STK.toast` and calling the `showSimple` function.  
Pass `SimpleToast` inside the closure.  

```swift
import SimpleToastKit

var body: some View {
    VStack {
        Button {
            STK.toast.showSimple {
                SimpleToast(message: "Message is Required")
            }
        } label: {
            Text("Show Simple Toast View")
                .foregroundStyle(Color.black)
        }
    }
    .toastable() // to the root view you want to show the toast on.
}
```

<br/>
  
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

<br/>
  
## When using a custom view

Trigger the toast view by accessing `STK.toast` and calling the `show` function. 

### Parameters

- **holdSec**: The number of seconds the toast view remains visible.
- **animationStyle**: The animation style used for presenting and dismissing the toast.
- **alignment**: The position where the toast view will appear. 
- **content**: A view builder closure that provides the custom content for the toast.

```swift
Button {
    STK.toast.show(holdSec: 1.0, animationStyle: .scaledFade, alignment: .bottom) {
        YourCustomView()
    }
} label: {
    Text("Show Toast View")
}
```

You can also use the **simplified method** by omitting the parameters.  

```swift
Button {
    STK.shared.showToastView {
        YourCustomView()
    }
} label: {
    Text("Show Toast View")
}
```

<br/>

## When using simple toast views

Trigger the toast view by accessing `STK.toast` and calling the `showSimple` function.  
**Pass `SimpleToast` inside the closure.**  

```swift
STK.toast.showSimple {
    SimpleToast(message: "Simplest way") // Should return SimpleToast()
}
```

### SimpleToast

A structure used to display a simple toast view.  
SimpleToast can be customized using modifier-style functions.

#### parameter

- **message**: The text that you want to display on the toast view **(required)**
- **holdSec**: The number of seconds the simple toast view remains visible.

#### modifiers
- **.toastAnimation**: The animation style used for presenting and dismissing the toast.
- **.toastShape**: Configures the shape and styling of the toast. Each shape supports specific customization parameters.
- **.topPadding**: The top padding of simpleToastView
- **.bottomPadding**: The bottom padding of simpleToastView
- **.alignment**: The position where the toast view will appear. 

```swift
Button {
    STK.toast.showSimple {
        SimpleToast(message: "Message is required", holdSec: 2.0)
            .toastAnimation(STKAnimationStyle.scaledFade)
            .topPadding(12)
            .bottomPadding(12)
            .alignment(.center)
            .toastShape(
                .roundedRectangle(
                    alignment: .leading,
                    messageColor: Color.white,
                    messageFont: .headline,
                    title: "Some Title",
                    titleFont: .title,
                    titleColor: Color.yellow,
                    leadingImage: Image("ToastKitImage", bundle: .module),
                    trailingImage: Image("ToastKitImage", bundle: .module),
                    backgroundColor: Color.black,
                    cornerRadius: 12,
                    insetVerticalPadding: 12,
                    insetHorizontalPadding: 24
                )
            )
    }
} label: {
    Text("Show Simple Toast View")
        .foregroundStyle(Color.black)
}
```


You can also use the **simplified method** by omitting the parameters.  
However, the message is always required.

```swift
Button {
    STK.toast.showSimple {
        SimpleToast(message: "Simplest way")
    }
} label: {
    Text("Show Simple Toast View")
        .foregroundStyle(Color.black)
}
```

<br/>

# 🏗️ Architecture structure
<img width="1067" alt="Image" src="https://github.com/user-attachments/assets/b7de925b-6084-4003-af11-0698e81cb70e" />

<br/>

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
