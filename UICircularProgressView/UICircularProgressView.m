//
//  UICircularProgressView.m
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

#import "UICircularProgressView.h"

@interface UICircularProgressView()

- (void)setup;

- (void)drawCircularProgress:(float)progress atPoint:(CGPoint)point withRadius:(CGFloat)radius inContext:(CGContextRef)context;
- (void)drawPieProgress:(float)progress atPoint:(CGPoint)center withRadius:(CGFloat)radius inContext:(CGContextRef)context;

@end

@implementation UICircularProgressView


@synthesize progress = _progress;
- (void)setProgress:(float)progress {
	if (progress != _progress) {
		if (progress > 1.0) { progress = 1.0; }
		if (progress < 0.0) { progress = 0.0; }
		_progress = progress;
		[self setNeedsDisplay];
	}
}

@synthesize progressTintColor = _progressTintColor;
- (void)setProgressTintColor:(UIColor *)progressTintColor {
	if (![progressTintColor isEqual:_progressTintColor]) {
		_progressTintColor = progressTintColor;
		[self setNeedsDisplay];
	}
}

@synthesize trackTintColor = _trackTintColor;
- (void)setTrackTintColor:(UIColor *)trackTintColor {
	if (![trackTintColor isEqual:_trackTintColor]) {
		_trackTintColor = trackTintColor;
		[self setNeedsDisplay];
	}
}

@synthesize progressViewStyle = _progressViewStyle;
- (void)setProgressViewStyle:(UICircularProgressViewStyle)progressViewStyle {
	if (progressViewStyle != _progressViewStyle) {
		_progressViewStyle = progressViewStyle;
		[self setNeedsDisplay];
	}
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		[self setup];
    }
    return self;
}
- (void)awakeFromNib {
	[self setup];
}

- (void)setup {
	self.progress = 0.0;
	self.trackTintColor = [UIColor whiteColor];
	self.progressTintColor = [UIColor blueColor];
	self.progressViewStyle = UICircularProgressViewStyleCircle;
}

- (void)drawCircularProgress:(float)progress atPoint:(CGPoint)center withRadius:(CGFloat)radius inContext:(CGContextRef)context {
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
	
	CGFloat startAngle = -M_PI_2;
	CGFloat endAngle = startAngle + (progress * 2 * M_PI);
	CGContextAddArc(context, center.x, center.y, radius, startAngle, endAngle, NO);
	
	CGContextStrokePath(context);
	UIGraphicsPopContext();
}

#define kLineWidth 5.0

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGPoint middlePoint;
	middlePoint.x = self.bounds.origin.x + self.bounds.size.width/2;
	middlePoint.y = self.bounds.origin.y + self.bounds.size.height/2;
	
	CGFloat radius = MIN(self.bounds.size.width/2, self.bounds.size.height/2);
	radius -= kLineWidth*2;
	
	CGContextSetLineWidth(context, kLineWidth);
	
	switch (self.progressViewStyle) {
		case UICircularProgressViewStylePie:
			[self.trackTintColor setFill];
			[self drawPieProgress:1.0 atPoint:middlePoint withRadius:radius inContext:context];
			[self.progressTintColor setStroke];
			[self drawCircularProgress:1.0 atPoint:middlePoint withRadius:radius inContext:context];
			[self.progressTintColor setFill];
			[self drawPieProgress:self.progress atPoint:middlePoint withRadius:radius inContext:context];
			break;
		case UICircularProgressViewStyleCircle:
		default:
			[self.trackTintColor setStroke];
			[self drawCircularProgress:1.0 atPoint:middlePoint withRadius:radius inContext:context];
			[self.progressTintColor setStroke];
			[self drawCircularProgress:self.progress atPoint:middlePoint withRadius:radius inContext:context];
			break;
	}
}

- (void)drawPieProgress:(float)progress atPoint:(CGPoint)center withRadius:(CGFloat)radius inContext:(CGContextRef)context {
	UIGraphicsPushContext(context);

	CGFloat startAngle = -M_PI_2;
	CGFloat endAngle = startAngle + (progress * 2 * M_PI);
	CGContextMoveToPoint(context, center.x, center.y);
	CGContextAddArc(context, center.x, center.y, radius, startAngle, endAngle, NO);
	
	CGContextClosePath(context);
	CGContextFillPath(context);
	UIGraphicsPopContext();
}

@end
