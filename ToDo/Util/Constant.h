//
//  Constant.h
//  EasyAccess
//
//  Created by Louise on 23/4/15.
//  Copyright (c) 2015 Louise. All rights reserved.
//

#ifndef EasyAccess_Constant_h
#define EasyAccess_Constant_h

#ifdef DEBUG
#	define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define DLog(...)
#endif

#define ALog(...) NSLog(__VA_ARGS__)

#define CenturyGothic @"CenturyGothic"
#define GlobalInstance [Global sharedInstance]

#define parseID @"kRkyxuKeR1DE7QAaUff0RKR4gCp3NP9QIAAs165B"
#define parseKey @"Xf0jcaJ2R1dIhlhJaewdUtNpJB6KCQjDumCzIrig"

#define USER_DEF_USERNAME @"username"
#define USER_DEF_EMAIL @"email"
#define USER_DEF_INS @"email"


#define USER_DEF_IS_VERIFIED @"isVerified"

//Header Bar
#define TitleHeaderFont @"CenturyGothic"
#define TitleHeaderFontSize 18.0
#define Theme_Header RGB(45, 139, 203)


#define MsgInfo @"Info Message"
#define MsgError @"Error Message"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

//STORYBOARD IDENTIFIER
#define SB_compose @"composeView"
#define SB_viewcompose @"viewCompose"









#endif
