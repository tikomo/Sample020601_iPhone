//
//  ViewController.m
//  Sample_20601
//
//  Created by tikomo on 2014/02/06.
//  Copyright (c) 2014年 tikomo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1; // 猫年齢入力フィールド
@property (weak, nonatomic) IBOutlet UILabel *label1; // 人年齢入力フィールド
- (IBAction)button1_onClick:(UIButton *)sender; // 計算ボタンのクリックイベント
- (IBAction)textField1_editingChanged:(UITextField *)sender;
- (IBAction)bkgTapped:(id)sender;

- (double) catAge2HumanAge:(double)catAge;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1_onClick:(UIButton *)sender {
    
    double catAge = [self catAge2HumanAge:[_textField1.text doubleValue]];
    
    NSString *ans = [NSString stringWithFormat:@"%.1f", catAge];
    
    _label1.text = ans;
    
}

- (IBAction)textField1_editingChanged:(UITextField *)sender {
    
    double catAge = [self catAge2HumanAge:[sender.text doubleValue]];
    
    NSString *ans = [NSString stringWithFormat:@"%.1f", catAge];
    
    _label1.text = ans;
}

//
// 背景タップでキーボードを消したい
//
- (IBAction)bkgTapped:(id)sender {
    [self.view endEditing:YES];
}

- (double) catAge2HumanAge:(double)catAge {
    
    double age;
    
    if(catAge <= 1) {
        
        age = 20 * catAge;
            
    } else if (catAge <= 5) {
        
        age = catAge * 6 + 15;
        
    } else if (catAge <= 10) {
        
        age = catAge * 5 + 20;
        
    } else if (catAge <=15) {
        
        age = catAge * 4 + 30;
        
    } else {
        
        age = 20 * catAge;
        
    }
    
    return age;
    
}

//
// 入力文字数を制限する
//
// これは画面全体の話なのかな〜
//
- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // 変更前のテキストを取得
    NSMutableString *tmp = [_textField1.text mutableCopy];
    
    // 編集後のテキストを作る
    [tmp replaceCharactersInRange:range withString:string];
    
    // 100歳以下である
    BOOL isAgeLimit = [tmp doubleValue] <= 100;
    
    // 4文字以下である
    BOOL isLengthLimit = [tmp length] <= 4; // tmp.legthでもOK
    
    return isAgeLimit && isLengthLimit;
}

@end
