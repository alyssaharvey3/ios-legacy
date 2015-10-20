//
//  IndexedForest.m
//  Owncloud iOs Client
//
//  Created by Javier Gonzalez on 02/10/15.
//
//

#import "IndexedForest.h"
#import "UtilsUrls.h"
#import "FolderSyncDto.h"
#import "ManageFilesDB.h"
#import "AppDelegate.h"
#import "SyncFolderManager.h"

@implementation IndexedForest

- (id) init{
    
    self = [super init];
    if (self) {
        self.treeDictionary = [CWLOrderedDictionary new];
    }
    return self;
}

- (void) addFileToTheForest:(FileDto *) file {
    
    NSString *key = [UtilsUrls getKeyByLocalFolder:file.localFolder];
    NSArray *keyDivided = [key componentsSeparatedByString:@"/"];
    NSString *keyConstructed = @"";
    
    CWLOrderedDictionary *structuredDict = self.treeDictionary;
    
    //Every keyDivided is a diferent level of the tree
    for (NSString *current in keyDivided) {
        
        keyConstructed = [keyConstructed stringByAppendingString:current];
        
        if (keyConstructed.length < key.length) {
            keyConstructed = [keyConstructed stringByAppendingString:@"/"];
            
            CWLOrderedDictionary *tmpDict = [structuredDict objectForKey:keyConstructed];
            
            if (!tmpDict) {
                //Not exist so we create a new one
                tmpDict = [CWLOrderedDictionary new];
                [structuredDict setObject:tmpDict forKey:keyConstructed];
            }
            
            structuredDict = [structuredDict objectForKey:keyConstructed];
            
        } else {
            //Is the file
            [structuredDict setObject:file forKey:keyConstructed];
        }
    }
}

- (void) removeFileFromTheForest:(FileDto *) file {
    
    NSString *key = [UtilsUrls getKeyByLocalFolder:file.localFolder];
    NSArray *keyDivided = [key componentsSeparatedByString:@"/"];
    NSString *keyConstructed = @"";
    
    CWLOrderedDictionary *structuredDict = self.treeDictionary;
    
    //1. Remove the file from the tree
    //Every keyDivided is a diferent level of the tree
    for (NSString *current in keyDivided) {
        
        keyConstructed = [keyConstructed stringByAppendingString:current];
        
        if (keyConstructed.length < key.length) {
            
            keyConstructed = [keyConstructed stringByAppendingString:@"/"];
            structuredDict = [structuredDict objectForKey:keyConstructed];
            
        } else {
            //Is the file
            [structuredDict removeObjectForKey:keyConstructed];
        }
    }
    
    //2. Remove the full structure of the tree if there is not any other file or folder on that tree
    //Now we have to check the structure in the reverse way
    BOOL isCheckingStructure = YES;
    
    //Remove the file from the key
    key = [key substringToIndex:[key length] - [key lastPathComponent].length];
    
    do {
        NSString *parentKey = [key substringToIndex:[key length] - ([key lastPathComponent].length+1)];
        if (![parentKey hasSuffix:@"/"]) {
            parentKey = [parentKey stringByAppendingString:@"/"];
        }
        
        CWLOrderedDictionary *parentDict;
        CWLOrderedDictionary *currentDict = [self getDictionaryOfTreebyKey:key];

       // NSString *folderToRemovePath;
        //NSString *folderToRemoveName = [NSString stringWithFormat:@"%@/",[key lastPathComponent]];
        
        if ([parentKey isEqualToString:@"/"]) {
            //Parent is the treeDictionary
            parentDict = self.treeDictionary;
            //folderToRemovePath = @"";
            
        } else {
            parentDict = [self getDictionaryOfTreebyKey:parentKey];
            //folderToRemovePath = parentKey;
        }
        
        if (currentDict.count == 0) {
            //The folder is empty
            
            //Remove current one from the parent
            [parentDict removeObjectForKey:key];
            
            //Refresh list to update the arrow
            AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            [app reloadCellByKey:key];

//            FileDto *folderRemoved = [ManageFilesDB getFileDtoByFileName:folderToRemoveName andFilePath:folderToRemovePath andUser:app.activeUser];
//            [app reloadTableFromDataBaseIfFileIsVisibleOnList:folderRemoved];
//
            //Continue with parent dictionary
            NSString *stringToRemove = [key lastPathComponent];
            key = [key substringToIndex:[key length] - (stringToRemove.length+1)];
            
            //We check if key is empty to not continue. The next to check is the root (treeDictionary)
            if (key.length == 0) {
                if (self.treeDictionary.count == 0) {
                    self.treeDictionary = [CWLOrderedDictionary new];
                    isCheckingStructure = NO;
                } else {
                    isCheckingStructure = NO;
                }
            }
            
        } else {
            //The folder is not empty
            isCheckingStructure = NO;
        }
        
        
    } while (isCheckingStructure);
}

- (CWLOrderedDictionary *) getDictionaryOfTreebyKey:(NSString *) key {
    
    NSMutableArray *keyDivided = [[key componentsSeparatedByString:@"/"] mutableCopy];
    [keyDivided removeLastObject];
    NSString *keyConstructed = @"";
    
    CWLOrderedDictionary *structuredDict = self.treeDictionary;
    
    //Every keyDivided is a diferent level of the tree
    while (keyDivided.count > 0) {
        
        NSString *current = [keyDivided objectAtIndex:0];
        [keyDivided removeObjectAtIndex:0];
        
        keyConstructed = [keyConstructed stringByAppendingString:current];
        keyConstructed = [keyConstructed stringByAppendingString:@"/"];
        
        structuredDict = [structuredDict objectForKey:keyConstructed];
        
    }
    
    return structuredDict;
}

- (BOOL) isFolderPendingToBeDownload:(FileDto *)folder {
    
    BOOL isFolderPending = NO;
    
    NSString *key = [UtilsUrls getKeyByLocalFolder:folder.localFolder];
    CWLOrderedDictionary *downloadingTreeForThisFolder = [self getDictionaryOfTreebyKey:key];
    CWLOrderedDictionary *pendingToCheckTreeForThisFolder = [[AppDelegate sharedSyncFolderManager].dictOfFoldersToBeCheck objectForKey:key];
    
    if ([downloadingTreeForThisFolder count] > 0 || pendingToCheckTreeForThisFolder!=nil) {
        isFolderPending = YES;
    }
    
    return isFolderPending;
}

@end
