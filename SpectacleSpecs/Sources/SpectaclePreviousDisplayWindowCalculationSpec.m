#import <Expecta/Expecta.h>

#import <OCHamcrest/OCHamcrest.h>

#import <OCMockito/OCMockito.h>

#import <Specta/Specta.h>

#import "SpectacleWindowPositionCalculationResult.h"
#import "SpectacleWindowPositionCalculator.h"

SpecBegin(SpectaclePreviousDisplayWindowCalculation)
describe(@"SpectaclePreviousDisplayWindowCalculation", ^{
  CGRect visibleFrameSourceScreen = CGRectMake(0.0f, 4.0f, 1440.0f, 873.0f);
  CGRect visibleFrameDestinationScreen = CGRectMake(1440.0f, 4.0f, 1440.0f, 873.0f);
  SpectacleWindowPositionCalculator *windowPositionCalculator = [[SpectacleWindowPositionCalculator alloc] initWithErrorHandler:^(NSString *message) {
    EXP_failure(message);
  }];

  it(@"should calculate a centered window's CGRect in the previous display", ^{
    SpectacleWindowPositionCalculationResult *result = [windowPositionCalculator calculateWindowRect:CGRectMake(438.0f, 248.0f, 564.0f, 384.0f)
                                                                          visibleFrameOfSourceScreen:visibleFrameSourceScreen
                                                                     visibleFrameOfDestinationScreen:visibleFrameDestinationScreen
                                                                                              action:kSpectacleWindowActionPreviousDisplay];
    expect(result.windowRect).to.equal(CGRectMake(1878.0f, 248.0f, 564.0f, 384.0f));
  });

  it(@"should calculate a fullscreen window's CGRect in the previous display", ^{
    SpectacleWindowPositionCalculationResult *result = [windowPositionCalculator calculateWindowRect:CGRectMake(0.0f, 4.0f, 1440.0f, 873.0f)
                                                                          visibleFrameOfSourceScreen:visibleFrameSourceScreen
                                                                     visibleFrameOfDestinationScreen:visibleFrameDestinationScreen
                                                                                              action:kSpectacleWindowActionPreviousDisplay];
    expect(result.windowRect).to.equal(CGRectMake(1440.0f, 4.0f, 1440.0f, 873.0f));
  });

  it(@"should calculate a window's identical CGRect in the previous display", ^{
    SpectacleWindowPositionCalculationResult *result = [windowPositionCalculator calculateWindowRect:CGRectMake(165.0f, 245.0f, 564.0f, 384.0f)
                                                                          visibleFrameOfSourceScreen:visibleFrameSourceScreen
                                                                     visibleFrameOfDestinationScreen:visibleFrameDestinationScreen
                                                                                              action:kSpectacleWindowActionPreviousDisplay];
    expect(result.windowRect).to.equal(CGRectMake(1605.0f, 245.0f, 564.0f, 384.0f));
  });
});
SpecEnd
