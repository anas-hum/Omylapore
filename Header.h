//
//  Header.h
//  Omylapore
//
//  Created by humworld on 20/11/14.
//  Copyright (c) 2014 humworld. All rights reserved.
//

#ifndef Omylapore_Header_h
#define Omylapore_Header_h

#define IS_IPHONE6 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )

#define IS_IPHONE6PLUS ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )736 ) < DBL_EPSILON )

#define IS_IPHONE5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define IS_IPHONE4 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480 ) < DBL_EPSILON )


#endif
