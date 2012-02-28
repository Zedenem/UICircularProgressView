//
///  UICircularProgressView.h
///  UICircularProgressView
//
//  Created by Zouhair Mahieddine on 27/02/12.
///  Copyright (c) 2012 Zouhair Mahieddine.
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

#import <UIKit/UIKit.h>

/** @name Constants */
/**
 * The styles permitted for the circular progress view.
 *
 * You can set and retrieve the current style of progress view through the progressViewStyle property.
 */
typedef enum {
	UICircularProgressViewStyleCircle,
	UICircularProgressViewStylePie,
} UICircularProgressViewStyle;

@interface UICircularProgressView : UIView

/**
 * The current progress shown by the receiver.
 *
 * The current progress is represented by a floating-point value between 0.0 and 1.0, inclusive, where 1.0 indicates the completion of the task.
 * The default value is 0.0. Values less than 0.0 and greater than 1.0 are pinned to those limits.
 */
@property (nonatomic) float progress;

/**
 * The color shown for the portion of the progress circle / pie that is filled.
 */
@property (nonatomic, retain) UIColor *progressTintColor;

/**
 * The color shown for the portion of the progress circle / pie that is not filled.
 */
@property (nonatomic, retain) UIColor *trackTintColor;

/**
 * The current graphical style of the receiver.
 *
 * The value of this property is a constant that specifies the style of the progress view. The default style is UICircularProgressViewStyleCircle. For more on these constants, see UICircularProgressViewStyle.
 */
@property (nonatomic) UICircularProgressViewStyle progressViewStyle;

@end
