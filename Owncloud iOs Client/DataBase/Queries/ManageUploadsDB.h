//
//  ManageUploadsDB.h
//  Owncloud iOs Client
//
//  Created by Gonzalo Gonzalez on 25/06/13.
//

/*
 Copyright (C) 2014, ownCloud, Inc.
 This code is covered by the GNU Public License Version 3.
 For distribution utilizing Apple mechanisms please see https://owncloud.org/contribute/iOS-license-exception/
 You should have received a copy of this license
 along with this program. If not, see <http://www.gnu.org/licenses/gpl-3.0.en.html>.
 */

#import <Foundation/Foundation.h>
#import "UploadsOfflineDto.h"
#import "ManageUsersDB.h"

@interface ManageUploadsDB : NSObject

/*
 * Method that insert an upload object into uploads_offline table
 * @upload -> upload object
 */
+(void) insertUpload:(UploadsOfflineDto *) upload;

/*
 * Method that update the status of the one upload.
 * @upload --> upload offline object
 */
+(void) updateUploadOfflineStatusByUploadOfflineDto:(UploadsOfflineDto *) upload;

/*
 * Method that delete an upload of the uploads table
 * @upload -> upload object
 */
+(void) deleteUploadOfflineByUploadOfflineDto:(UploadsOfflineDto *) upload;

/*
 * Method that delete al rows of uploads_offline table
 *
 */
+(void) cleanTableUploadsOfflineTheFinishedUploads;

/*
 * Method that insert in uploads_offline a list of uploads objects
 * @listOfUploadOffline -> list of upload objects
 */
+(void) insertManyUploadsOffline:(NSMutableArray *) listOfUploadOffline;

/*
 * Method that return the last upload
 */
+(UploadsOfflineDto *) getNextUploadOfflineFileToUpload;

/*
 * Method to change the state of a UploadOffline
 */
+(void) setStatus:(NSInteger) status andKindOfError:(NSInteger) kindOfError byUploadOffline:(UploadsOfflineDto *) currentUpload;


/*
 * This method set the date of finished upload
 * @currentUpload --> object updated
 */

+ (void) setDatebyUploadOffline:(UploadsOfflineDto *)currentUpload;



/*
 * This method set the date of finished upload
 * @currentUpload --> object updated
 */

+ (void) setDatebyUploadOffline:(UploadsOfflineDto *)currentUpload;


/*
 * Method to return all the files with a single status
 */

+ (NSMutableArray *) getUploadsByStatus:(int) status;

+ (NSMutableArray *) getUploads;

/*
 * Method that return an array with all uploads of the uploads_offline
 */
+ (NSMutableArray *) getUploadsByInsert;

/*
 * Method to update al files that failed to upload with waiting to start again without reopen the app
 */
+ (void) updateAllErrorUploadOfflineWithWaitingAddUploadList;

/*
 * Method to update the files that failed to upload with waiting to start again after reopen the app (check not updloaded files)
 */
+ (void) updateNotFinalizeUploadsBackgroundBy:(NSArray *) uploadsArray;


/*
 * Method to update al files that failed to upload with waiting to start again after reopen the app (check not uploaded, uploading and waitingforupload files)
 */
+ (void) updateNotFinalizeUploadsOfflineBy:(NSArray *) uploadsArray;

/*
 * Method to return all the files with a single status
 */

+ (NSMutableArray *) getUploadsByStatus:(int) status andByKindOfError:(int) kindOfError;

/*
 * Method to return all the files with a error
 */

+ (NSMutableArray *) getUploadsWithErrorByStatus:(int) status;

/*
 * Method that save only one number the files in the uploads_offline table
 * @uploads -> The number of the first uploads to save
 */
+(void) saveInUploadsOfflineTableTheFirst:(NSUInteger)uploads;

/*
 * Method that update all the files with error credential that have been corrected by user
 */
+ (void) updateErrorCredentialFiles:(NSInteger) userSelected;

/*
 * Method that update the file with conflict error that have been corrected by user changing the name of the file
 */
+ (void) updateErrorFolderNotFoundFilesSetNewDestinyFolder:(NSString *) folder forUploadOffline:(UploadsOfflineDto *) selectedUpload;

/*
 * Method that update the file with conflict error that have been corrected by user
 */
+ (void) updateErrorConflictFilesSetNewName:(NSString *) name forUploadOffline:(UploadsOfflineDto *) selectedUpload;

/*
 * Method that update the file with conflict error that have been corrected by user set overwrite
 */
+ (void) updateErrorConflictFilesSetOverwrite:(BOOL) isNotNecessaryCheckIfExist forUploadOffline:(UploadsOfflineDto *) selectedUpload;

/*
 * Method set all uploads to check if the file exist in order to show overwrite or rename 
 */
+ (void) updateAllUploadsWithNotNecessaryCheck;

/*
 * Method that return if there are files in upload process as a uploading, waiting for upload and error uploading states.
 */
+ (BOOL) isFilesInUploadProcess;

/*
 * Method that return a upload offline dto by id
 *  @uploadOfflineId -> id of upload offline
 */
+ (UploadsOfflineDto*)getUploadOfflineById:(NSInteger)uploadOfflineId;

///-----------------------------------
/// @name Set task_identifier Number for Upload Offline
///-----------------------------------

/**
 * Method that set a hash of the offline
 *
 * @param hash -> NSInteger
 * @param upload -> UploadsOfflineDto
 */
+ (void) setTaskIdentifier:(NSInteger)taskIdentifier forUploadOffline:(UploadsOfflineDto *)upload;



@end
