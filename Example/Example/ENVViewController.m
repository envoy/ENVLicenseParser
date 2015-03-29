@import AVFoundation;
#import "ENVLicenseParser.h"
#import "ENVViewController.h"

@interface ENVViewController () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic) AVCaptureSession *session;

@end

@implementation ENVViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
  if (!device) {
    return;
  }

  self.session = [[AVCaptureSession alloc] init];
  AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device
                                                                      error:nil];
  AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
  if (![self.session canAddInput:input]) {
    return;
  }

  if (![self.session canAddOutput:output]) {
    return;
  }

  [self.session addInput:input];
  [self.session addOutput:output];

  [output setMetadataObjectTypes:@[AVMetadataObjectTypePDF417Code]];
  [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];

  [self.session startRunning];

  AVCaptureVideoPreviewLayer *layer = [[AVCaptureVideoPreviewLayer alloc]
                                       initWithSession:self.session];
  layer.frame = self.view.frame;
  [self.view.layer addSublayer:layer];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputMetadataObjects:(NSArray *)metadataObjects
       fromConnection:(AVCaptureConnection *)connection {
  NSString *string;
  for (AVMetadataMachineReadableCodeObject *metadata in metadataObjects) {
    if (![metadata.type isEqualToString:AVMetadataObjectTypePDF417Code]) {
      continue;
    }

    string = [metadata stringValue];
    break;
  }

  if (string.length == 0) {
    NSLog(@"Failed to scan");
    return;
  }

  NSString *filename = @"newscan.txt";
  NSURL *documentsDirectory = [[[NSFileManager defaultManager]
                                URLsForDirectory:NSDocumentDirectory
                                inDomains:NSUserDomainMask] firstObject];
  NSURL *fileURL = [documentsDirectory URLByAppendingPathComponent:filename];
  NSLog(@"Scanned: %@", string);
  ENVPerson *person = [ENVBaseLicenseParser personFromString:string];
  NSLog(@"Scanned name: %@ license ID: %@ address: %@ is expired: %@",
        person.name, person.licenseID, person.address,
        person.expired ? @"Yes" : @"No");
  BOOL written = [string writeToURL:fileURL
                         atomically:YES
                           encoding:NSUTF8StringEncoding
                              error:nil];
  if (!written) {
    NSLog(@"Failed to save scan");
  }
}


@end
