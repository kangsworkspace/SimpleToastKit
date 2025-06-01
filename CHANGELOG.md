# Release Note (2.2.5)
### Added
- Added ``.slideTop`` Animation. (2025-05-21)  
  Useful when toast view is aligned to the top.

- Added `injectUsecase(_:)` method in `ViewModel`. (2025-05-24)  
  Only available in DEBUG mode for injecting mock use cases in tests.
  
### Fixed
- Fixed archive error. (2025-05-29)  
  Change type `.static` to `.dynamic`  


# Release Note (2.2.4)
### Added
- Add padding option to SimpleToast. (2025-05-13)  
  This option was added because the toast view was positioned directly above the tab bar,  
  which made it necessary to provide a padding option.
  
- Add alignment option to SimpleToast & custom toastview. (2025-05-14)  
  This option was added to support cases where the toast view needs to appear in the middle or at the top of the screen.  
  
### Fixed
- Slide bottom animation now dismisses correctly. (2025-05-11)  
  A bug where the toast view disappeared with a fade animation instead of sliding back to the bottom has been resolved.
  
### Changed
- Improved feedback for repeated button taps. (2025-05-18)  
  When the button is tapped rapidly or repeatedly, the toast view now disappears and reappears more smoothly, making the transition feel more natural.
