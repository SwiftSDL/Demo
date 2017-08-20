import CSDL
import CSDLImage

public enum TextureError: Error {
  case nullPointer
}

public class Texture: SDLObject<SDL_Texture> {
  public convenience init(renderer: Renderer, file: String) throws {
    guard let handle = IMG_LoadTexture(renderer.opaquePointer, file) else {
      throw TextureError.nullPointer
    }
    self.init(handle: SDLHandle<SDL_Texture>(handle))
  }

  public convenience init(renderer: Renderer, surface: Surface) throws {
    guard let handle = SDL_CreateTextureFromSurface(renderer.opaquePointer,
                                                    surface.handle) else {
      throw TextureError.nullPointer
    }
    self.init(handle: SDLHandle<SDL_Texture>(handle))
  }

  public func destroy() {
    SDL_DestroyTexture(self.opaquePointer)
  }
}
