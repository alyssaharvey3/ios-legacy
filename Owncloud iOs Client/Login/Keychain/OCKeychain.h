//
//  OCKeychain.h
//  Owncloud iOs Client
//
//  Created by Noelia Alvarez on 22/10/14.
//

/*
 Copyright (C) 2017, ownCloud GmbH.
 This code is covered by the GNU Public License Version 3.
 For distribution utilizing Apple mechanisms please see https://owncloud.org/contribute/iOS-license-exception/
 You should have received a copy of this license
 along with this program. If not, see <http://www.gnu.org/licenses/gpl-3.0.en.html>.
 */

#import <Foundation/Foundation.h>
#import "CredentialsDto.h"

@interface OCKeychain : NSObject

+(BOOL)setCredentialsOfUser:(UserDto *)user;
+(CredentialsDto *)getCredentialsById:(NSString *)idUser;
+(BOOL)removeCredentialsById:(NSString *)idUser;
+(BOOL)updateCredentialsOfUser:(UserDto *)user;
+(BOOL)resetKeychain;


///-----------------------------------
/// @name updateAllKeychainsToUseTheLockProperty
///-----------------------------------

/**
 * This method updates all the credentials to use a property to allow to access to them when the passcode system is set.
 * Used in db update 12-13
 */
+(void)updateAllKeychainsToUseTheLockProperty;

+(BOOL)updateKeychainForUseLockPropertyForUser:(NSString *)idUser;


@end
