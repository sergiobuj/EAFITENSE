//
//  ModalViewLogin.m
//  AuthenticationModal
//
//  Created by Sergio Botero on 11/15/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "ModalViewLogin.h"


@implementation ModalViewLogin
@synthesize delegate;
@synthesize userField;
@synthesize passField;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
//    [super viewDidLoad];
	// the creation

	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame]];
	
	userField = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, contentView.frame.size.width-20, 45)];
	passField = [[UITextField alloc] initWithFrame:CGRectMake(10, 130, contentView.frame.size.width-20, 45)];
	
	
	//text field setup
	userField.borderStyle = UITextBorderStyleRoundedRect;
	passField.borderStyle = UITextBorderStyleRoundedRect;

	passField.secureTextEntry = YES;

	userField.returnKeyType = UIReturnKeyNext;
	passField.returnKeyType = UIReturnKeyDone;
	
	//content view setup
	[contentView setBackgroundColor:[UIColor grayColor]];
	[contentView addSubview:userField];
	[contentView addSubview:passField];
	[userField setDelegate:self];
	[userField setTag:1];
	[passField setDelegate:self];
	[passField setTag:2];
	//view setup
	self.view = contentView;
	self.title = NSLocalizedString(@"login_win_title",@"");	
	//release
	
	[contentView release];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *cancelB = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButton)];
	UIBarButtonItem *sendB = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(login)];
	
	self.navigationItem.rightBarButtonItem = sendB;
	self.navigationItem.leftBarButtonItem = cancelB;
	
	[sendB release];
	[cancelB release];
	
}


- (void) cancelButton{

	if ([self.delegate respondsToSelector:@selector(loginCancelled)]) {
		[self dismissModalViewControllerAnimated:YES];
		[self.delegate loginCancelled];
	}

}


-(void) login{
	if ([self.delegate respondsToSelector:@selector(loginWithUsername:andPass:)]) {
		[self.delegate loginWithUsername:[userField text] andPass:[passField text]];
	}
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
	if( textField.tag == 1){
		[passField becomeFirstResponder];
	}else{
		[self login];
	}
	
	return YES;
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[userField release];
	[passField release];
	[super dealloc];
}


@end
