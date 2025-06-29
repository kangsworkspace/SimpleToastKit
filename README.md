# 🥪 SimpleToastKit
<img src="https://github.com/user-attachments/assets/bad504cd-5fff-40f1-89e0-982bb09c0dca" width="300" height="300" />

[![Swift](https://img.shields.io/badge/Swift-5.9_5.10_6.0-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.9_5.10_6.0-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-iOS_15+-yellowgreen?style=flat-square)](...)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-Compatible-blue?style=flat-square)](...)

> **The simplest way to show toast view in your SwiftUI project.**
  
  
# 📒 Latest Release Note (2.3.0)
### Added
  
### Fixed
- Fixed archive error. (2025-06-01)  
  Refactored the main entry point logic to resolve linker issues.  
  Changed `STK` from an `enum` to a concrete implementation type.
  The implementaion type and its methods are now exposed but cannot be used.
  
### Changed



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

## Animation examples
| STKAnimationStyle.fade | STKAnimationStyle.scaledFade |
|:-:|:-:|
| <img src = "https://github.com/user-attachments/assets/452d9bd1-d534-4c2f-bac4-c048ac13d472" width="180" /> | <img src = "https://github.com/user-attachments/assets/5004880a-9cd0-4579-86dc-6b47f7768985" width="180" /> |

| STKAnimationStyle.slideBottom | STKAnimationStyle.slideTop |
|:-:|:-:|
| <img src = "https://github.com/user-attachments/assets/8c291686-ca54-48cf-876c-bcf7c7c42e25" width="180" /> | <img src = "https://github.com/user-attachments/assets/ee9e78c2-467b-4217-b298-93a6cbc19579" width="180" /> |

| STKAnimationStyle.slideLeft | STKAnimationStyle.slideRight |
|:-:|:-:|
| <img src = "https://github.com/user-attachments/assets/b89da0df-5d1c-4a3a-b254-3a13181f66fb" width="180" /> | <img src = "https://github.com/user-attachments/assets/4bedd664-7a01-48b7-abc2-1e88d540535b" width="180" /> |

<br/>

# 🏗️ Architecture structure
<img width="1207" alt="스크린샷 2025-06-01 오후 8 44 04" src="https://github.com/user-attachments/assets/b42c170e-9c47-42d5-8717-39fe16cec07e" />
<img width="1077" alt="스크린샷 2025-06-01 오후 8 59 55" src="https://github.com/user-attachments/assets/932d5d10-c609-4e32-ac22-a52493068530" />


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
