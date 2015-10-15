//
//  StartRSVPCell.m
//  GoParking
//
//  Created by Shang Wang on 10/12/15.
//  Copyright (c) 2015 Shang Wang. All rights reserved.
//

#import "StartRSVPCell.h"
#import "IGLDropDownMenu.h"

@interface StartRSVPCell () <IGLDropDownMenuDelegate>

@property (nonatomic, strong) IGLDropDownMenu *dropDownMenu;
@end

@implementation StartRSVPCell
@synthesize timeLable;
@synthesize feeLable;
@synthesize carlable;
@synthesize priceLable;
@synthesize plateLable;
@synthesize dropDown;
#define kStringArray [NSArray arrayWithObjects:@"YES", @"NO",@"Wiki",@"Google",@"Concept Map", nil]
- (void)awakeFromNib {
    // Initialization code
    carlable.layer.cornerRadius=carlable.frame.size.height/3;
    carlable.clipsToBounds=YES;
    
    feeLable.layer.cornerRadius=feeLable.frame.size.height/3;
    feeLable.clipsToBounds=YES;
    
    timeLable.layer.cornerRadius=timeLable.frame.size.height/3;
    timeLable.clipsToBounds=YES;
    
    priceLable.layer.cornerRadius=priceLable.frame.size.height/3;
    priceLable.clipsToBounds=YES;
    

    
    NSArray *dataArray = @[@{@"title":@"京F3204"},
                           @{@"title":@"浙A4924"},
                           @{@"title":@"京C3422"},];
    NSMutableArray *dropdownItems = [[NSMutableArray alloc] init];
    for (int i = 0; i < dataArray.count; i++) {
        NSDictionary *dict = dataArray[i];
        
        IGLDropDownItem *item = [[IGLDropDownItem alloc] init];
        [item setText:dict[@"title"]];
        [dropdownItems addObject:item];
    }
    
    self.dropDownMenu = [[IGLDropDownMenu alloc] init];
    self.dropDownMenu.menuText = @"京A9752";
    self.dropDownMenu.dropDownItems = dropdownItems;
    self.dropDownMenu.paddingLeft = 12;
    [self.dropDownMenu setFrame:plateLable.frame];
    self.dropDownMenu.delegate = self;
    [plateLable setHidden:YES];
    // You can use block instead of delegate if you want
    /*
     __weak typeof(self) weakSelf = self;
     [self.dropDownMenu addSelectedItemChangeBlock:^(NSInteger selectedIndex) {
     __strong typeof(self) strongSelf = weakSelf;
     IGLDropDownItem *item = strongSelf.dropDownMenu.dropDownItems[selectedIndex];
     strongSelf.textLabel.text = [NSString stringWithFormat:@"Selected: %@", item.text];
     }];
     */
    
    self.dropDownMenu.type = IGLDropDownMenuTypeStack;
    self.dropDownMenu.gutterY = 3;
    
    [self.dropDownMenu reloadView];
    
    [self addSubview:self.dropDownMenu];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)drop:(id)sender {
}




#pragma mark - IGLDropDownMenuDelegate

- (void)dropDownMenu:(IGLDropDownMenu *)dropDownMenu selectedItemAtIndex:(NSInteger)index
{
    IGLDropDownItem *item = dropDownMenu.dropDownItems[index];
    //self.textLabel.text = [NSString stringWithFormat:@"Selected: %@", item.text];
}


@end
