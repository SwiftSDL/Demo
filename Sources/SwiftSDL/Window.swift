import CSDL

enum WindowError: Error {
  case nullPointer
}

public struct WindowFlags: OptionSet {
  public let rawValue: UInt32
  public init(rawValue: UInt32) {
    self.rawValue = rawValue
    
  }
}

public class Window: SDLObject<SDL_Window> {

  public convenience init(title: String, x: UInt32, y: UInt32,
      w: UInt32, h: UInt32, flags: UInt32) throws {
    guard let handle = SDL_CreateWindow(title, Int32(x), Int32(y),
        Int32(w), Int32(h), flags) else {
      throw WindowError.nullPointer
    }
    self.init(handle: SDLHandle<SDL_Window>(handle))
  }

  public func destroy() {
    SDL_DestroyWindow(self.opaquePointer)
  }
}
