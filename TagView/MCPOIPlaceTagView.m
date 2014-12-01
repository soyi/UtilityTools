//
//  MCPOIPlaceTagView.m
//  MapComPlatform
//
//  Created by baidu on 14-9-26.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import "MCPOIPlaceTagView.h"

#define FontSize        11.f
#define TagInterval     5.f
#define TagLabelHeight  15.f

@implementation MCPOIPlaceTagView

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self removeAllSubviews];
    
    CGFloat lastMaxX = 0.0;
    for (NSString *string in self.textArray)
    {
        if ([string isKindOfClass:[NSString class]]&&string.length>0)
        {
            UIFont *tagFont = [UIFont systemFontOfSize:FontSize];
            CGFloat tagLblWidth = [string sizeWithFont:tagFont].width + 10.f;
            if (tagLblWidth < self.frame.size.width - lastMaxX)
            {
                UILabel *tagLbl = [[UILabel alloc] initWithFrame:CGRectMake(lastMaxX, 0, tagLblWidth, TagLabelHeight)];
                [self addSubview:tagLbl];
                tagLbl.backgroundColor = HexColor(0xe7ebee);
                tagLbl.textColor = HexColor(0x737373);
                tagLbl.font = tagFont;
                tagLbl.textAlignment = NSTextAlignmentCenter;
                tagLbl.text = string;
                
                lastMaxX = CGRectGetMaxX(tagLbl.frame) + TagInterval;
            }
        }
    }
}

@end
