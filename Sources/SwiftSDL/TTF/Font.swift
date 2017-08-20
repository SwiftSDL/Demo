import CSDL
import CSDLTTF

public enum FontError: Error {
  case nullPointer
}

public class Font: SDLObject<TTF_Font> {
  public convenience init(file: String, size: Int) throws {
    guard let handle = TTF_OpenFont(file, Int32(size)) else {
      throw FontError.nullPointer
    }
    self.init(handle: SDLHandle<TTF_Font>(handle))
  }
}
