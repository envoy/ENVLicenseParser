@import AVFoundation;
#import "ENVViewController.h"

@interface ENVViewController () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic) AVCaptureSession *session;

@end

@implementation ENVViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;

    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device
                                                                        error:&error];
    if (input) {
        [session addInput:input];
    } else {
        NSLog(@"Error: %@", error);
    }

    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [session addOutput:output];
    [output setMetadataObjectTypes:@[AVMetadataObjectTypePDF417Code]];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    [session startRunning];
    self.session = session;

    AVCaptureVideoPreviewLayer *layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    layer.frame = self.view.frame;
    [self.view.layer addSublayer:layer];
}

 - (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputMetadataObjects:(NSArray *)metadataObjects
        fromConnection:(AVCaptureConnection *)connection
{
    NSString *QRCode = nil;
    for (AVMetadataObject *metadata in metadataObjects) {
        if ([metadata.type isEqualToString:AVMetadataObjectTypePDF417Code]) {
            // This will never happen; nobody has ever scanned a QR code... ever
            QRCode = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
            break;
        }
    }

    NSArray *compoments = [QRCode componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *filename = @"Unknown";
    for (NSString *component in compoments) {
        if (component.length != 5) {
            continue;
        }

        if (![[component uppercaseString] hasPrefix:@"DAJ"]) {
            continue;
        }

        NSString *state = [component substringFromIndex:3];
        filename = state;
    }

    NSURL *documentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
    NSURL *fileURL = [documentsDirectory URLByAppendingPathComponent:filename];
    NSLog(@"QR Code: %@", QRCode);
    NSError *error = nil;
    [QRCode writeToURL:fileURL atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"Write error: %@", error);
}


@end
