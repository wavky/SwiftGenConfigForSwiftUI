# SwiftGen 在 Swift5 + SwiftUI 下的配置方案
## 使用环境
* Swift 5
* SwiftUI
* 不使用 storyboard 和 xib
* 不勾选 Use Base Internationalization
* 本地化（默认英语）

## 安装
```
brew install swiftgen
```


## 配置
### 配置文件 
将三个配置文件放置在项目根目录下：
* swiftgen.yml：SwiftGen 配置文件
* swiftui-assets-template.stencil：与 SwiftUI 适配的 xcassets 模板 
* swiftui-strings-template.stencil：与 SwiftUI 适配的 String 模板 

项目结构参考：
```
${PROJECT}
├── swiftgen.yml
├── swiftui-assets-template.stencil
├── swiftui-strings-template.stencil
├── ${PROJECT}.xcodeproj
└── ${PROJECT}
    ├── Generated
    ├── Resources
    │   ├── Color.xcassets
    │   ├── Image.xcassets
    │   └── Localizable.strings
    ├── ContentView.swift
    ├── App.swift
    ├── Info.plist
    ├── InfoPlist.strings
    └── Preview Content
```

### 添加编译脚本
1. 点击导航栏的项目文件
2. 选择 TARGETS - Build Phases
3. 点击窗口左上角 + 按钮，选择 New Run Script Phase
4. 添加一句脚本
```
swiftgen
```

### 生成索引辅助类
1. ⌘B 执行项目编译
2. 左侧文件导航栏中右键：Add Files to …
3. 选择在 Generated 目录下生成的文件，添加到项目中即可（不要勾选复制）


## 在 SwiftUI 中使用
```swift
Image(Asset.Image.image_name.name) // 图片类资源
Text(L10n.Category.text_name.key) // 文本类资源
    .foregroundColor(
        Asset.Color.color_name.color // 颜色资源
    )

L10n.Category.text_name.text // 返回 String 类型
Asset.Color.color_name.nsColor // 返回 NSColor 类型
Asset.Color.color_name.uiColor // 返回 UIColor 类型
```

- - - -
## 其他
配置文件语法参考：
[SwiftGen/ConfigFile.md at stable · SwiftGen/SwiftGen · GitHub](https://github.com/SwiftGen/SwiftGen/blob/stable/Documentation/ConfigFile.md)

关于对 SwiftUI(LocalizedStringKey) 提供支持的讨论：
[SwiftUI use of LocalizedStringKey · Issue #685 · SwiftGen/SwiftGen · GitHub](https://github.com/SwiftGen/SwiftGen/issues/685)
