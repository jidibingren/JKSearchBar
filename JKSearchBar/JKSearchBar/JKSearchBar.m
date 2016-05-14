//
//  JKSearchBar.m
//  JKSearchBar
//
//  Created by Jakey on 15/5/3.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "JKSearchBar.h"
@interface JKSearchBar()<UITextFieldDelegate>
{
    UITextField *_textField;
    UIImageView *_iconView;
    UIImageView *_iconCenterView;
    UIImageView *_backgroundImageView;
    JKSearchBarIconAlign _iconAlignTemp;
}

@end

@implementation JKSearchBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buidViewWithFrame:frame];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self buidViewWithFrame:self.frame];
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        
    }
}
-(void)buidViewWithFrame:(CGRect)frame{
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 44);
    
//    _cancelButton = ({
//        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        cancelButton.frame = CGRectMake(self.frame.size.width-60, 7, 60, 30);
//        cancelButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
//        [cancelButton addTarget:self
//                         action:@selector(cancelButtonTouched)
//               forControlEvents:UIControlEventTouchUpInside];
//        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
//        [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        
//        cancelButton.autoresizingMask =UIViewAutoresizingFlexibleLeftMargin;
//        
//        cancelButton;
//    });
//    [self addSubview:_cancelButton];
    
    
//    _textField = ({
//        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(7, 7, self.frame.size.width-7*2, 30)];
//        textField.delegate = self;
//        textField.borderStyle = UITextBorderStyleNone;
//        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//        textField.returnKeyType = UIReturnKeySearch;
//        textField.enablesReturnKeyAutomatically = YES;
//        textField.font = [UIFont systemFontOfSize:14.0f];
//        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//        [textField addTarget:self
//                      action:@selector(textFieldDidChange:)
//            forControlEvents:UIControlEventEditingChanged];
//        textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//        
//        //for dspa
//        textField.borderStyle=UITextBorderStyleNone;
//        textField.layer.cornerRadius= 3.0f;
//        textField.layer.masksToBounds=YES;
//        textField.layer.borderColor = [[UIColor colorWithWhite:0.783 alpha:1.000] CGColor];
//        textField.layer.borderWidth= 0.5f;
//        textField.backgroundColor = [UIColor whiteColor];
//        
//        textField;
//    });
//    [self addSubview:_textField];
    
    self.frame = frame;
    
    _backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    
    _backgroundImageView.contentMode = UIViewContentModeScaleToFill;
    
    _backgroundImageView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_backgroundImageView];
    
    _cancelButton = ({
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(self.frame.size.width-60, 7, 60, frame.size.height-7*2);
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [cancelButton addTarget:self
                         action:@selector(cancelButtonTouched)
               forControlEvents:UIControlEventTouchUpInside];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        cancelButton.autoresizingMask =UIViewAutoresizingFlexibleLeftMargin;
        
        cancelButton;
    });
    [self addSubview:_cancelButton];
    
    
    _textField = ({
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(7, 7, self.frame.size.width-7*2, frame.size.height-7*2)];
        textField.delegate = self;
        textField.borderStyle = UITextBorderStyleNone;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.returnKeyType = UIReturnKeySearch;
        textField.enablesReturnKeyAutomatically = YES;
        textField.font = [UIFont systemFontOfSize:14.0f];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [textField addTarget:self
                      action:@selector(textFieldDidChange:)
            forControlEvents:UIControlEventEditingChanged];
        textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        //for dspa
        textField.borderStyle=UITextBorderStyleNone;
        textField.layer.cornerRadius= 3.0f;
        textField.layer.masksToBounds=YES;
        textField.layer.borderColor = [[UIColor colorWithWhite:0.783 alpha:1.000] CGColor];
        textField.layer.borderWidth= 0.5f;
        textField.backgroundColor = [UIColor whiteColor];
        
        textField;
    });
    [self addSubview:_textField];
    
    _cancelButton.hidden = YES;
    self.backgroundColor = [UIColor colorWithRed:0.733 green:0.732 blue:0.756 alpha:1.000];
}
-(void)setIconAlign:(JKSearchBarIconAlign)iconAlign{
    if(!_iconAlignTemp){
        _iconAlignTemp = iconAlign;
    }
    _iconAlign = iconAlign;
    [self ajustIconWith:_iconAlign];
    
}
-(void)ajustIconWith:(JKSearchBarIconAlign)iconAlign{
    if (_iconAlign == JKSearchBarIconAlignCenter) {
        _iconCenterView.hidden = NO;
        
        _textField.frame = CGRectMake(7, 7, self.frame.size.width-7*2, self.frame.size.height-7*2);
        _textField.textAlignment = NSTextAlignmentCenter;
        
        CGSize titleSize;
        if (!self.text || ![self.text isEqualToString:@""]) {
            titleSize =  [self.text sizeWithAttributes: @{NSFontAttributeName:_textField.font}];
        }else{
            titleSize =  [self.placeholder?:@"" sizeWithAttributes: @{NSFontAttributeName:_textField.font}];
            
        }
        
        CGFloat x = _textField.frame.size.width/2 - titleSize.width/2-25;
        
        if (!_iconCenterView) {
            _iconCenterView = [[UIImageView alloc]initWithImage: _iconImage ? _iconImage : [UIImage imageNamed:@"JKSearchBar_ICON"]];
            _iconCenterView.contentMode = UIViewContentModeScaleAspectFit;
            [_textField addSubview:_iconCenterView];
        }
        if (x>0) {
            _iconCenterView.frame = CGRectMake(x, (_textField.frame.size.height-_iconCenterView.frame.size.height)/2, _iconCenterView.frame.size.width, _iconCenterView.frame.size.height);
            _textField.leftView = nil;
        }else{
            _iconCenterView.hidden = YES;
            _textField.leftView = _iconView;
        }
        
    }else{
        _iconCenterView.hidden = YES;
        
        [UIView animateWithDuration:1 animations:^{
            _textField.textAlignment = NSTextAlignmentLeft;
            _iconView = [[UIImageView alloc]initWithImage:_iconImage ? _iconImage : [UIImage imageNamed:@"JKSearchBar_ICON"]];
            _iconView.contentMode = UIViewContentModeScaleAspectFit;
            _textField.leftView = _iconView;
            _textField.leftViewMode =  UITextFieldViewModeAlways;
        }];
    }
}
-(NSString *)text{
    return _textField.text;
}

-(void)setText:(NSString *)text{
    _textField.text= text?:@"";
}
-(void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    [_textField setFont:_textFont];
    [self setIconAlign:_iconAlign];
}

-(void)setTextBorderStyle:(UITextBorderStyle)textBorderStyle{
    _textBorderStyle = textBorderStyle;
    _textField.borderStyle = textBorderStyle;
}

-(void)setTfCornerRadius:(CGFloat)tfCornerRadius{
    _tfCornerRadius = tfCornerRadius;
    _textField.layer.cornerRadius = tfCornerRadius;
}

-(void)setTfMasksToBounds:(BOOL)tfMasksToBounds{
    _tfMasksToBounds = tfMasksToBounds;
    _textField.layer.masksToBounds = tfMasksToBounds;
}

-(void)setTfBorderColor:(UIColor*)tfBorderColor{
    _tfBorderColor = tfBorderColor;
    _textField.layer.borderColor = tfBorderColor.CGColor;
}

-(void)setTfBorderWidth:(CGFloat)tfBorderWidth{
    _tfBorderWidth = tfBorderWidth;
    _textField.layer.borderWidth = tfBorderWidth;
}

-(void)setTfBackgroundColor:(UIColor *)tfBackgroundColor{
    _tfBackgroundColor = tfBackgroundColor;
    _textField.backgroundColor = tfBackgroundColor;
}

-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    [_textField setTextColor:_textColor];
}
-(void)setIconImage:(UIImage *)iconImage{
    _iconImage = iconImage;
    
    if (!_textField.leftView) {
        ((UIImageView*)_textField.leftView).image = _iconImage;
    }
    
    if (!_iconCenterView) {
        _iconCenterView.image = _iconImage;
    }
}
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    _textField.placeholder = placeholder;
    [self setIconAlign:_iconAlign];
}

-(void)setBackgroundImage:(UIImage *)backgroundImage{
    _backgroundImage = backgroundImage;
    _backgroundImageView.image = backgroundImage;
}

-(void)setCancelButton:(UIButton *)cancelButton{
    if (_cancelButton) {
        [_cancelButton removeFromSuperview];
    }
    _cancelButton = cancelButton;
    [self addSubview:cancelButton];
}

-(void)setCbTitleFont:(UIFont *)cbTitleFont{
    _cbTitleFont = cbTitleFont;
    _cancelButton.titleLabel.font = cbTitleFont;
}

-(void)setCbTitleColor:(UIColor *)cbTitleColor{
    _cbTitleColor = cbTitleColor;
    [_cancelButton setTitleColor:cbTitleColor forState:UIControlStateNormal];
}

-(void)setCbBackgroundColor:(UIColor *)cbBackgroundColor{
    _cbBackgroundColor = cbBackgroundColor;
    [_cancelButton setBackgroundColor:cbBackgroundColor];
}

-(void)setCbBackgroundImage:(UIImage *)cbBackgroundImage{
    _cbBackgroundImage = cbBackgroundImage;
    [_cancelButton setBackgroundImage:cbBackgroundImage forState:UIControlStateNormal];
}

-(void)setCbTitle:(NSString *)cbTitle{
    _cbTitle = cbTitle;
    [_cancelButton setTitle:cbTitle forState:UIControlStateNormal];
}

-(void)setKeyboardType:(UIKeyboardType)keyboardType{
    _keyboardType = keyboardType;
    _textField.keyboardType = _keyboardType;
}
-(void)setInputView:(UIView *)inputView{
    _inputView = inputView;
    _textField.inputView = _inputView;
}
//- (BOOL)isUserInteractionEnabled
//{
//    return YES;
//}
//
//- (BOOL)canBecomeFirstResponder
//{
//    return YES;
//}
-(void)setInputAccessoryView:(UIView *)inputAccessoryView{
    _inputAccessoryView = inputAccessoryView;
    _textField.inputAccessoryView = _inputAccessoryView;
}
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    NSAssert(_placeholder, @"Please set placeholder before setting placeholdercolor");
    
    if ([[[UIDevice currentDevice] systemVersion] integerValue] < 6)
    {
        [_textField setValue:_placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    else
    {
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    }
}
-(BOOL)resignFirstResponder
{
    return [_textField resignFirstResponder];
}

-(void)cancelButtonTouched
{
    _textField.text = @"";
    [_textField resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarCancelButtonClicked:)])
    {
        [self.delegate searchBarCancelButtonClicked:self];
    }
}
-(void)setAutoCapitalizationMode:(UITextAutocapitalizationType)type
{
    _textField.autocapitalizationType = type;
}
#pragma --mark textfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(_iconAlignTemp == JKSearchBarIconAlignCenter){
        self.iconAlign = JKSearchBarIconAlignLeft;
    }
    
    if (!_cancelButtonDisabled) {
        [UIView animateWithDuration:0.1 animations:^{
            _cancelButton.hidden = NO;
            _textField.frame = CGRectMake(7, 7, _cancelButton.frame.origin.x-7, self.frame.size.height-7*2);
            //        _textField.transform = CGAffineTransformMakeTranslation(-_cancelButton.frame.size.width,0);
        }];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)])
    {
        return [self.delegate searchBarShouldBeginEditing:self];
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarTextDidBeginEditing:)])
    {
        [self.delegate searchBarTextDidBeginEditing:self];
    }
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarShouldEndEditing:)])
    {
        return [self.delegate searchBarShouldEndEditing:self];
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(_iconAlignTemp == JKSearchBarIconAlignCenter){
        self.iconAlign = JKSearchBarIconAlignCenter;
    }
    
    if (!_cancelButtonDisabled) {
        [UIView animateWithDuration:0.1 animations:^{
            _cancelButton.hidden = YES;
            _textField.frame = CGRectMake(7, 7, self.frame.size.width-7*2, self.frame.size.height-7*2);
            //        _textField.transform = CGAffineTransformMakeTranslation(-_cancelButton.frame.size.width,0);
        }];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarTextDidEndEditing:)])
    {
        [self.delegate searchBarTextDidEndEditing:self];
    }
}
-(void)textFieldDidChange:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBar:textDidChange:)])
    {
        [self.delegate searchBar:self textDidChange:textField.text];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBar:shouldChangeTextInRange:replacementText:)])
    {
        return [self.delegate searchBar:self shouldChangeTextInRange:range replacementText:string];
    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBar:textDidChange:)])
    {
        [self.delegate searchBar:self textDidChange:@""];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_textField resignFirstResponder];
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchBarSearchButtonClicked:)])
    {
        [self.delegate searchBarSearchButtonClicked:self];
    }
    return YES;
}
@end
