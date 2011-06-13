//
//  ModalViewLogin.h
//  AuthenticationModal
//
//  Created by Sergio Botero on 11/15/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewLoginDelegate;
@interface ModalViewLogin : UIViewController <UITextFieldDelegate> {
	id <ModalViewLoginDelegate> delegate;
	UITextField *userField;
	UITextField *passField;

}
@property (nonatomic, assign) id <ModalViewLoginDelegate> delegate;
@property (nonatomic, retain) UITextField *userField;
@property (nonatomic, retain) UITextField *passField;

- (void) cancelButton;

@end


@protocol ModalViewLoginDelegate <NSObject>
- (void) loginWithUsername:(NSString *) username andPass:(NSString *)password;
- (void) loginCancelled;
@end

