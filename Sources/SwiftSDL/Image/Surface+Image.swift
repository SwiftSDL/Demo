import CSDL
import CSDLImage

public extension Surface {
  public convenience init(file: String) throws {
    guard let handle = IMG_Load(file) else {
      throw SurfaceError.nullPointer
    }
    self.init(handle: SDLHandle<SDL_Surface>(handle))
  }
}
