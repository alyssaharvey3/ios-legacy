//
//  FolderSyncDto.h
//  Owncloud iOs Client
//
//  Created by Javier Gonzalez on 29/09/15.
//
//

/*
 Copyright (C) 2014, ownCloud, Inc.
 This code is covered by the GNU Public License Version 3.
 For distribution utilizing Apple mechanisms please see https://owncloud.org/contribute/iOS-license-exception/
 You should have received a copy of this license
 along with this program. If not, see <http://www.gnu.org/licenses/gpl-3.0.en.html>.
 */

#import "FileDto.h"

@interface FolderSyncDto : NSObject

@property NSInteger idFolderSync;
@property (nonatomic, strong) FileDto *file;
@property BOOL isReadFromDatabase;
@property NSInteger taskIdentifier;

@end
