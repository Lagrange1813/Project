//
//  CustomTextView.swift
//  MDHighlight
//
//  Created by 张维熙 on 2022/5/3.
//

import UIKit
import SnapKit

class TestTextView: UIScrollView {
    let identificateView = CustomTextView()
    
    init() {
        super.init(frame: CGRect())
        isScrollEnabled = true
        identificateView.isScrollEnabled = false
        identificateView.delegate = self
        addSubview(identificateView)
        
        identificateView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
        }
        
        let bodyFont = UIFont(name: "LXGW WenKai", size: 15)
        
        let bodyParagraphStyle: NSMutableParagraphStyle = {
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 3.5
            style.paragraphSpacing = 7
            style.firstLineHeadIndent = 2 * bodyFont!.pointSize
            style.alignment = .justified
            style.paragraphSpacingBefore = 7
            return style
        }()
        
        let bodyAttributes: [NSAttributedString.Key: Any] = [
            .font: bodyFont as Any,
            .baselineOffset: -3.5,
            .foregroundColor: UIColor.black,
            .paragraphStyle: bodyParagraphStyle
        ]
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        view.backgroundColor = .gray
        
//        identificateView.font?.lineHeight = 10
        
        identificateView.inputAccessoryView = view
        
//        identificateView.
        
        identificateView.typingAttributes = bodyAttributes
        identificateView.autocorrectionType = .no
        
//        identificateView.setInputAccessoryView
        
        identificateView.text = "# Header 1\n## Header 2\n### Header 3\n\nThis is some **bold** text.\nThis is some *italic* text.\nThis is some `inline code`.\nThis is a custom @regex rule.\n\nThis is a custom [URL](http://google.com).\nThis is an image ![image description](http://google.com).\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nOpening paragraph, with an ordered list of autumn leaves I found\n\n1. A big leaf\n1. Some small leaves:\n\t1. Red (nested)\n\t2. **Orange**\n\t3. Yellow\n1. A medium sized leaf that ~~maybe~~ was pancake shaped\n\nUnordered list of fruits:\n\n- Blueberries\n- Apples\n\t- Macintosh\n\t- Honey crisp\n\t- Cortland\n- Banana\n\n### Fancy Header Title\n\nHere's what someone said:\n\n> I think blockquotes are cool\n\nNesting **an *[emphasized link](https://apolloapp.io)* inside strong text**, neato!\n\nAnd then they mentiond code around `NSAttributedString` that looked like this code block:\n\n```swift\nfunc yeah() -> NSAttributedString {\n\t// TODO: Write code\n}\n```\n\nTables are even supported but (but need more than `NSAttributedString`  for support :p)\n“我虽然在戍边营里当准尉，可还是像流放犯那样受到监视。然而我在驻地的那个小城受到的接待好得不得了。我大手大脚地花钱，人家都相信我很富有，连我自己也相信这一点。不过，想必我还有别的什么地方赢得他们的好感。尽管他们对我的品行连连摇头，可是挺喜欢我。我的上司，一位已经上了年纪的中校，不知为什么瞧我觉得不顺眼。他老是找我的碴儿。可是我有后台，再说，全城的人都站在我这边，所以也没法跟我太过不去。都怪我自己不好，我故意不向他表示应有的尊敬。是我的傲气在作怪。\n“这个老顽固其实人不坏，心肠挺好，很热情，先后有过两个妻子，两个都去世了。第一个妻子是寻常人家出身，给他生了个女儿，也很纯朴。我在那里的时候，她已经是个二十四岁的大姑娘了，跟父亲和姨妈——她已故母亲的姐姐——住在一起。姨妈属于那种百依百顺的纯朴型；外甥女，也就是中校的长女，表现的则是一种朝气蓬勃的单纯。我喜欢用美好的语言回忆往事。亲爱的小弟，以前我从未遇见过有哪一个女人性格比这姑娘更可爱的，她叫阿嘉菲娅，连同父名是阿嘉菲娅·伊万诺夫娜。她的模样也相当可以，俄罗斯风韵：高高的个儿，结实、丰满，眼睛挺漂亮，相貌嘛，是粗点儿。她还没有出嫁，虽然有两家来提过亲，都让她给拒绝了，过后她照旧乐乐和和的。我跟她相交了——可不是相好，不，我们之间清清白白，纯粹是朋友。我跟女人相交的方式往往一清二白，并不越出友谊的范围。\n“我跟她谈话的内容倒是毫无顾忌，坦率得惊人！她只是笑声不断。不少女人喜欢坦率，可是别忘了她还是姑娘家，这一点在我看来特别有趣。还得指出这样一个情况，那就是：怎么也没法把她当作一位小姐对待。\n“她和姨妈都住在她父亲家里，她们好像有点儿自愿降低身份，不把自己摆在和其余的人平等的地位上。别人都喜欢她，需要她，因为她是个很有名气的裁缝——在这门手艺上她有出众的才能，给人家做衣服并不要钱，只是做个人情，但如果人家给钱，她也不拒绝。至于中校嘛——可就大不相同了！中校是我们那地方的头面人物。他十分好客，广交全城名流，常在家里举行晚宴和舞会。我到那里入营的时候，整个小城都在谈论，中校的次女很快将从首都光临该城，她可是百里挑一的大美人，当时刚毕业于京里一所贵族女子学校。这位二小姐——她就是卡捷琳娜·伊万诺夫娜——为中校的续弦夫人所生。而这位续弦夫人也已经去世，她出身于一个颇有名望的将军之家，然而我从可靠的消息来源得知，她也没有给中校带去任何钱财。就是说，娶这么一位续弦夫人只是名义上攀了一门高亲，如此而已，要就是对前程也许有所裨益，实惠可是一点儿也没有。\nAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBCCCCCCCCCDDDDDDDDDDEEEEEEEEEEEEFFFFFFFFFFFGGGGGGGGGGHHHHHHHHHIIIIIIIIIIIIJJJJJJJJJJJJKKKKKKKKKKLLLLLLLLLLLMMMMMMMMMMMNNNNNNNNNOOOOOOOOPPPPPPPPPQQQQQQQQRRRRRRSSSSSSSTTTTTTTTTUUUUUUUVVVVVVVWWWWWWWWXXXXXXXXYYYYYYYYYYZZZZZZZZZZZaaaaaaaaaaaabbbbbbbbbbbcccccccccccdddddddddeeeeeeeeefffffffffffggggggggggghhhhhhhhhhhhiiiiiiiiiiijjjjjjjjjjjkkkkkkkklllllllmmmmmmmmmmmnnnnnnnnnnnnoooooooooopppppppppqqqqqqqqqqqrrrrrrrrrrrssssssssssttttttttttuuuuuuuvvvvvvvvvwwwwwwwxxxxxyyyyyyyzzzzzz\nAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBCCCCCCCCCDDDDDDDDDDEEEEEEEEEEEEFFFFFFFFFFFGGGGGGGGGGHHHHHHHHHIIIIIIIIIIIIJJJJJJJJJJJJKKKKKKKKKKLLLLLLLLLL\nLMMMMMMMMMMMNNNNNNNNNOOOOOOOOPPPPPPPPPQQQQQ\nQQQRRRRRRSSSSSSSTTTTTTTTTUUUUUUUVVVVVVVWWWWWWWWXXXXXXXXYYYYYYYYYYZZZZZZZZZZZaaaaaaaaaaaabbbbbbbbbbbcccccccccccdddddddddeeeeeeeeefffffffffffggggggggggghhhhhhhhhhhhiiiii\niiiiiijjjjjjjjjjjkkkkkkkklllllllmmmmmmmmmmmnnnnnnnnnnnnoooooooooopppppppppqqqqqqqqqqqrrrrrrrrr\nrrssssssssssttttttttttuuuuuuuvvvvvvvvvwwwwwwwxxxxxyyyyyyyzzzzzz"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TestTextView: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        print(textView.selectionRects(for: textView.selectedTextRange!).count)
    }
    
//    func textViewDidChange(_ textView: UITextView) {
//        for view in subviews {
//            if view.description == "UIAutocorrectShadowView" {
//                view.frame.origin.y -= 100
//            }
//        }
//    }
}
