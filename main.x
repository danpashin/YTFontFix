#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

%hook ELMTextNode
- (void)setAttributedText:(NSAttributedString *)attributedText {
    // Should check video entity before

    NSRange fontRange = NSMakeRange(0, 0);
    NSDictionary *attributes = [attributedText attributesAtIndex:0 effectiveRange:&fontRange];
    UIFont *font = attributes[NSFontAttributeName];
    const long int fSize = lround(font.pointSize);

    // Top one is 12pt while bottom one is 10pt
    // Without A/B they must be 14pt and 12pt correspondingly
    if (fSize == 10 || fSize == 12) {
        NSMutableDictionary *mutableAttributes = attributes.mutableCopy;
        mutableAttributes[NSFontAttributeName] = [font fontWithSize:font.pointSize + 2.0];

        NSMutableAttributedString *mutableText = attributedText.mutableCopy;
        [mutableText setAttributes:mutableAttributes range:fontRange];
        attributedText = mutableText;
    }

    %orig(attributedText);
}

%end
