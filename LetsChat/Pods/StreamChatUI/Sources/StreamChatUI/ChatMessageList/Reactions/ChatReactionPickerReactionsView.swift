//
// Copyright © 2021 Stream.io Inc. All rights reserved.
//

@available(iOS 13, *)
open class ChatReactionPickerReactionsView: ChatMessageReactionsView {
    override public var reactionItemView: ChatMessageReactionItemView.Type {
        components.reactionPickerReactionItemView
    }
}
