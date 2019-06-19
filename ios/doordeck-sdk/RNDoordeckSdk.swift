import Foundation

@objc(RNDoordeckSdk)
class RNDoordeckSdk: NSObject {
  
  private var doordeck: Doordeck! = nil
  
  @objc func initDoordeck(_ auth: String) {
    let authToken = AuthTokenClass(auth)
    doordeck = Doordeck(authToken)
    doordeck.delegate = self
    doordeck.Initialize()
  }
  
  @objc func showUnlock() {
    if (doordeck != nil) {
      doordeck.showUnlockScreen(success: {
        print("success")
      }) {
        print("fail")
      }
    }
  }
  
}

extension RNDoordeckSdk: DoordeckProtocol {
  func verificationNeeded() {
    print("Verification needed")
  }

  func newAuthTokenRequired() -> AuthTokenClass {
    print("New auth token required")
    return AuthTokenClass("")
  }

  func unlockSuccessful() {
    print("Unlock successful")
  }

}

