//
//  UICircularProgressViewViewController.m
//  UICircularProgressView
//
//  Created by Zouhair Mahieddine on 27/02/12.
//  Copyright (c) 2012 Zouhair Mahieddine.
//  http://www.zedenem.com
//  
//  This file is part of the UICircularProgressView Library.
//  
//  UICircularProgressView is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  UICircularProgressView is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with UICircularProgressView.  If not, see <http://www.gnu.org/licenses/>.
//

#import "UICircularProgressViewViewController.h"
#import "UICircularProgressView.h"

@interface UICircularProgressViewViewController ()

@property (unsafe_unretained, nonatomic) IBOutlet UIProgressView *barStyleProgressView;
@property (unsafe_unretained, nonatomic) IBOutlet UIProgressView *defaultStyleProgressView;
@property (unsafe_unretained, nonatomic) IBOutlet UICircularProgressView *circularProgressView;

- (void)resetProgress;
- (void)incrementProgress:(NSTimer *)timer;

@end

@implementation UICircularProgressViewViewController

@synthesize barStyleProgressView = _barStyleProgressView;
@synthesize defaultStyleProgressView = _defaultStyleProgressView;
@synthesize circularProgressView = _circularProgressView;

- (void)viewDidLoad {
    [super viewDidLoad];
	[self resetProgress];
}

- (void)viewDidUnload {
    [self setBarStyleProgressView:nil];
    [self setDefaultStyleProgressView:nil];
	[self setCircularProgressView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
	    return YES;
	}
}

- (IBAction)setProgressTintColor:(UIButton *)sender {
	[self.circularProgressView setProgressTintColor:sender.titleLabel.textColor];
	if ([self.barStyleProgressView respondsToSelector:@selector(setProgressTintColor:)]) {
		[self.barStyleProgressView setProgressTintColor:sender.titleLabel.textColor];
		[self.defaultStyleProgressView setProgressTintColor:sender.titleLabel.textColor];
	}
}

- (IBAction)setTrackTintColor:(UIButton *)sender {
	[self.circularProgressView setTrackTintColor:sender.titleLabel.textColor];
	if ([self.barStyleProgressView respondsToSelector:@selector(setTrackTintColor:)]) {
		[self.barStyleProgressView setTrackTintColor:sender.titleLabel.textColor];
		[self.defaultStyleProgressView setTrackTintColor:sender.titleLabel.textColor];
	}
}

- (IBAction)setProgressViewStyleToCircle {
	[self.circularProgressView setProgressViewStyle:UICircularProgressViewStyleCircle];
}

- (IBAction)setProgressViewStyleToPie {
	[self.circularProgressView setProgressViewStyle:UICircularProgressViewStylePie];
}


#define kStep 0.01
#define kUpdateInterval 0.01

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	//[NSTimer scheduledTimerWithTimeInterval:kUpdateInterval target:self selector:@selector(incrementProgress:) userInfo:nil repeats:YES];
}

- (void)resetProgress {
	[self.barStyleProgressView setProgress:0];
	[self.defaultStyleProgressView setProgress:0];
	[self.circularProgressView setProgress:0];
}

- (void)incrementProgress:(NSTimer *)timer {
	if (self.barStyleProgressView.progress == 1.0) {
		[self resetProgress];
	}
	[self.barStyleProgressView setProgress:self.barStyleProgressView.progress+kStep];
	[self.defaultStyleProgressView setProgress:self.defaultStyleProgressView.progress+kStep];
	[self.circularProgressView setProgress:self.circularProgressView.progress+kStep];
}
- (IBAction)setProgress:(UISlider *)sender {
	[self.barStyleProgressView setProgress:sender.value];
	[self.defaultStyleProgressView setProgress:sender.value];
	[self.circularProgressView setProgress:sender.value];
}

@end
