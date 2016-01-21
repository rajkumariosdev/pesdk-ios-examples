//
//  FocusEditorViewControllerOptions.swift
//  imglyKit
//
//  Created by Sascha Schwabbauer on 21/01/16.
//  Copyright © 2016 9elements GmbH. All rights reserved.
//

import UIKit

/// This closure allows the configuration of the given `ImageCaptionButton`,
/// depending on the linked focus action.
public typealias FocusActionButtonConfigurationClosure = (ImageCaptionButton, FocusAction) -> ()

@objc(IMGLYFocusEditorViewControllerOptions) public class FocusEditorViewControllerOptions: EditorViewControllerOptions {
    /// Defines all allowed focus actions. The focus buttons are shown in the given order.
    /// Defaults to show all available modes. The .Off action is always added. To set this
    /// property from Obj-C, see the `allowedFocusActionsAsNSNumbers` property.
    public let allowedFocusActions: [FocusAction]

    /// This closure allows further configuration of the action buttons. The closure is called for
    /// each action button and has the button and its corresponding action as parameters.
    public let actionButtonConfigurationClosure: FocusActionButtonConfigurationClosure

    public convenience init() {
        self.init(builder: FocusEditorViewControllerOptionsBuilder())
    }

    public init(builder: FocusEditorViewControllerOptionsBuilder) {
        allowedFocusActions = builder.allowedFocusActions
        actionButtonConfigurationClosure = builder.actionButtonConfigurationClosure
        super.init(editorBuilder: builder)
    }
}

// swiftlint:disable type_name
@objc(IMGLYFocusEditorViewControllerOptionsBuilder) public class FocusEditorViewControllerOptionsBuilder: EditorViewControllerOptionsBuilder {
    // swiftlint:enable type_name

    /// Defines all allowed focus actions. The focus buttons are shown in the given order.
    /// Defaults to show all available modes. The .Off action is always added. To set this
    /// property from Obj-C, see the `allowedFocusActionsAsNSNumbers` property.
    public var allowedFocusActions: [FocusAction] = [ .Off, .Linear, .Radial ] {
        didSet {
            if !allowedFocusActions.contains(.Off) {
                allowedFocusActions.append(.Off)
            }
        }
    }

    /// This closure allows further configuration of the action buttons. The closure is called for
    /// each action button and has the button and its corresponding action as parameters.
    public var actionButtonConfigurationClosure: FocusActionButtonConfigurationClosure = { _ in }


    /// An array of `FocusAction` raw values wrapped in NSNumbers.
    /// Setting this property overrides any previously set values in
    /// `allowedFocusActions` with the corresponding `FocusAction` values.
    public var allowedFocusActionsAsNSNumbers: [NSNumber] {
        get {
            return allowedFocusActions.map { NSNumber(integer: $0.rawValue) }
        }

        set {
            allowedFocusActions = newValue.flatMap { FocusAction(rawValue: $0.integerValue) }
        }
    }


    public override init() {
        super.init()

        /// Override inherited properties with default values
        self.title = Localize("Focus")
    }
}
