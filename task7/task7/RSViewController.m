//
//  RSViewController.m
//  task7
//
//  Created by Adam Bokun on 5.07.21.
//

#import "RSViewController.h"

@interface RSViewController ()
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *secureView;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;

@end



@implementation RSViewController

- (void)viewDidLoad{
    self.password.layer.borderWidth = 1.5;
    self.password.layer.cornerRadius = 5;
    self.login.layer.borderWidth = 1.5;
    self.login.layer.cornerRadius = 5;
    self.button.layer.borderWidth = 2;
    self.button.layer.cornerRadius = 10;
    self.button.layer.borderColor = [UIColor colorNamed:@"LittleBoyBlue"].CGColor;
    self.oneButton.layer.borderWidth = 1.5;
    self.oneButton.layer.cornerRadius = 25;
    self.oneButton.layer.borderColor = [UIColor colorNamed:@"LittleBoyBlue"].CGColor;
    self.twoButton.layer.borderWidth = 1.5;
    self.twoButton.layer.cornerRadius = 25;
    self.twoButton.layer.borderColor = [UIColor colorNamed:@"LittleBoyBlue"].CGColor;
    self.threeButton.layer.borderWidth = 1.5;
    self.threeButton.layer.cornerRadius = 25;
    self.threeButton.layer.borderColor = [UIColor colorNamed:@"LittleBoyBlue"].CGColor;
    self.secureView.layer.borderWidth = 2;
    self.secureView.layer.cornerRadius = 10;
    self.secureView.layer.borderColor = [UIColor colorNamed:@"White"].CGColor;
    self.secureView.hidden = YES;
    self.login.delegate = self;
    self.password.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
      [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)authorize:(id)sender {
    NSString *enteredPassword = [_password text];
    NSString *enteredName = [_login text];
    if (![enteredPassword  isEqual: @"password"]) {
        self.password.layer.borderColor = [UIColor colorNamed:@"VenetianRed"].CGColor;
    }
    if (![enteredName  isEqual: @"username"]) {
        self.login.layer.borderColor = [UIColor colorNamed:@"VenetianRed"].CGColor;
    }
    if ([enteredPassword  isEqual: @"password"] && [enteredName  isEqual: @"username"]) {
        self.secureView.hidden = NO;
        self.login.layer.borderColor = [UIColor colorNamed:@"TurquoiseGreen"].CGColor;
        self.login.alpha = 0.5;
        self.password.layer.borderColor = [UIColor colorNamed:@"TurquoiseGreen"].CGColor;
        self.password.alpha = 0.5;
        self.button.alpha = 0.5;
        _button.enabled = NO;
        _password.enabled = NO;
        _login.enabled = NO;
    }
    
}

-(void) InformativeAlertWithmsg: (NSString * ) msg {
  UIAlertController * alertvc = [UIAlertController alertControllerWithTitle: @"Welcome" message: msg preferredStyle: UIAlertControllerStyleAlert
                                 ];
  UIAlertAction * action = [UIAlertAction actionWithTitle: @"Refresh" style: UIAlertActionStyleDestructive handler: ^ (UIAlertAction * _Nonnull action) {
        self.login.layer.borderColor = [UIColor colorNamed:@"Black"].CGColor;
        self.password.layer.borderColor = [UIColor colorNamed:@"Black"].CGColor;
        self.login.alpha = 1;
        self.password.alpha = 1;
        self.button.alpha = 1;
        self->_result.text = @"—";
        self.secureView.layer.borderColor = [UIColor colorNamed:@"White"].CGColor;
        self.secureView.hidden = YES;
        self->_password.text = @"";
        self->_login.text = @"";
        self->_oneButton.enabled = YES;
        self->_twoButton.enabled = YES;
        self->_threeButton.enabled = YES;
        self->_button.enabled = YES;
        self->_password.enabled = YES;
        self->_login.enabled = YES;
    }
    ];
  [alertvc addAction: action];
  [self presentViewController: alertvc animated: true completion: nil];
}

- (void)secureAction:(int)value {

    
    if ([_result.text  isEqual: @"—"]) {
        _result.text = @"";
    }
    if (value == 1 && [_result.text length] <= 3) {
        _result.text = [_result.text stringByAppendingString:@"1"];
        _oneButton.enabled = NO;
//        self.oneButton.layer.backgroundColor = [UIColor colorNamed:@"LittleBoyBlue"].CGColor;
    }
    if (value == 2 && [_result.text length] <= 3) {
        _result.text = [_result.text stringByAppendingString:@"2"];
        _twoButton.enabled = NO;
    }
    if (value == 3 && [_result.text length] <= 3) {
        _result.text = [_result.text stringByAppendingString:@"3"];
        _threeButton.enabled = NO;
    }
    if ([_result.text  isEqual: @"132"]) {
        self.secureView.layer.borderColor = [UIColor colorNamed:@"TurquoiseGreen"].CGColor;
        [self InformativeAlertWithmsg:@"You are successfuly authorized!"];
    }
    if (![_result.text  isEqual: @"132"] && [_result.text length] == 3) {
        self.secureView.layer.borderColor = [UIColor colorNamed:@"VenetianRed"].CGColor;
        _result.text = @"—";
        _oneButton.enabled = YES;
        _twoButton.enabled = YES;
        _threeButton.enabled = YES;
    }
}

- (IBAction)oneAction:(UIButton *)sender {
    [self secureAction:1];
}
- (IBAction)twoAction:(UIButton *)sender {
    [self secureAction:2];
}
- (IBAction)threeAction:(id)sender {
    [self secureAction:3];
}

@end
