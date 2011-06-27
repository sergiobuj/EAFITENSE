//
//  ClassDayCellView.m
//  EAFITENSE
//
//  Created by Sergio Botero on 6/26/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//

#import "ClassDayCellView.h"


@implementation ClassDayCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
