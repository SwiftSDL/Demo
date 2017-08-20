import CSDL

enum SurfaceError: Error {
  case nullPointer
}

public class Surface: SDLObject<SDL_Surface> {
  public convenience init(window: Window) throws {
    try self.init(windowHandle: window.handle)
  }

  public convenience init(windowHandle: SDLHandle<SDL_Window>) throws {
    let pointer = OpaquePointer(windowHandle)
    guard let handle = SDL_GetWindowSurface(pointer) else {
      throw SurfaceError.nullPointer
    }
    self.init(handle: handle)
  }
}
