/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "EC2Volume.h"


@implementation EC2Volume

@synthesize volumeId;
@synthesize size;
@synthesize snapshotId;
@synthesize availabilityZone;
@synthesize state;
@synthesize createTime;
@synthesize attachments;
@synthesize tags;


-(id)init
{
    if (self = [super init]) {
        volumeId         = nil;
        size             = nil;
        snapshotId       = nil;
        availabilityZone = nil;
        state            = nil;
        createTime       = nil;
        attachments      = [[NSMutableArray alloc] initWithCapacity:1];
        tags             = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addAttachment:(EC2VolumeAttachment *)attachment
{
    if (attachments == nil) {
        attachments = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [attachments addObject:attachment];
}

-(void)addTag:(EC2Tag *)tag
{
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tag];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeId: %@,", volumeId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Size: %@,", size] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SnapshotId: %@,", snapshotId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreateTime: %@,", createTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Attachments: %@,", attachments] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [volumeId release];
    [size release];
    [snapshotId release];
    [availabilityZone release];
    [state release];
    [createTime release];
    [attachments release];
    [tags release];

    [super dealloc];
}


@end
