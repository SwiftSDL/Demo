import CSDL
import CSDLTTF

public extension Surface {
  public convenience init(font: Font, text: String, color: Color) throws {
    guard let handle = TTF_RenderText_Solid(font.opaquePointer,
                                            text, color.sdlStruct) else {
      throw SurfaceError.nullPointer
    }
    self.init(handle: SDLHandle<SDL_Surface>(handle))
  }
}
