//
//  JKSearchBar.h
//  JKSearchBar
//
//  Created by Jakey on 15/5/3.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, JKSearchBarIconAlign) {
    JKSearchBarIconAlignLeft,
    JKSearchBarIconAlignCenter
};
@class JKSearchBar;
@protocol JKSearchBarDelegate <UIBarPositioningDelegate>

@optional

-(BOOL)searchBarShouldBeginEditing:(JKSearchBar *)searchBar;                      // return NO to not become first responder
- (void)searchBarTextDidBeginEditing:(JKSearchBar *)searchBar;                     // called when text starts editing
- (BOOL)searchBarShouldEndEditing:(JKSearchBar *)searchBar;                        // return NO to not resign first responder
- (void)searchBarTextDidEndEditing:(JKSearchBar *)searchBar;                       // called when text ends editing
- (void)searchBar:(JKSearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)
- (BOOL)searchBar:(JKSearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text; // called before text changes

- (void)searchBarSearchButtonClicked:(JKSearchBar *)searchBar;                     // called when keyboard search button pressed
- (void)searchBarCancelButtonClicked:(JKSearchBar *)searchBar;                     // called when cancel button pressed
// called when cancel button pressed
@end


@interface JKSearchBar : UIView<UITextInputTraits>

@property(nonatomic,assign) id<JKSearchBarDelegate> delegate;              // weak reference. default is nil
@property(nonatomic,copy)   NSString               *text;                  // current/starting search text
@property(nonatomic,retain) UIColor                *textColor;
@property(nonatomic,retain) UIFont                 *textFont;
@property(nonatomic,copy)   NSString               *placeholder;           // default is nil
@property(nonatomic,retain) UIColor                *placeholderColor;
@property(nonatomic,retain) UIImage                *iconImage;
@property(nonatomic,retain) UIImage                *backgroundImage;

@property(nonatomic,retain) UIButton *cancelButton; //lazy
@property(nonatomic,strong) UIFont   *cbTitleFont;
@property(nonatomic,strong) NSString *cbTitle;
@property(nonatomic,strong) UIColor  *cbTitleColor;
@property(nonatomic,strong) UIColor  *cbBackgroundColor;
@property(nonatomic,strong) UIImage  *cbBackgroundImage;


@property(nonatomic,assign) UITextBorderStyle       textBorderStyle;
@property(nonatomic,assign) CGFloat                 tfCornerRadius;
@property(nonatomic,assign) BOOL                    tfMasksToBounds;
@property(nonatomic,assign) CGFloat                 tfBorderWidth;
@property(nonatomic,strong) UIColor                 *tfBorderColor;
@property(nonatomic,strong) UIColor                 *tfBackgroundColor;

@property(nonatomic)        UIKeyboardType          keyboardType;
@property(nonatomic)        JKSearchBarIconAlign    iconAlign;     //text aligh model

@property(nonatomic,assign) BOOL                    cancelButtonDisabled;

@property (nonatomic, readwrite, retain) UIView *inputAccessoryView;
@property (nonatomic, readwrite, retain) UIView *inputView;

-(BOOL)resignFirstResponder;
-(void)setAutoCapitalizationMode:(UITextAutocapitalizationType)type;
@end


