//
//  UICircularProgressViewAppDelegate.h
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

#import <UIKit/UIKit.h>

@class UICircularProgressViewViewController;

@interface UICircularProgressViewAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UICircularProgressViewViewController *viewController;

@end
