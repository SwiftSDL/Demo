import CSDL

public enum RendererError: Error {
  case nullPointer
}

public struct RendererFlip: OptionSet, SDLStruct {
  public typealias S = SDL_RendererFlip
  public static func fromSdlStruct(_ sdlStruct: SDL_RendererFlip) -> RendererFlip {
    return RendererFlip(rawValue: sdlStruct.rawValue)
  }

  public var sdlStruct: SDL_RendererFlip {
    get {
      return SDL_RendererFlip(self.rawValue)
    }
    set {
      self.rawValue = newValue.rawValue
    }
  }

  public var rawValue: UInt32
  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }
  public static let none =
    RendererFlip(rawValue: SDL_FLIP_NONE.rawValue)
  public static let horizontal =
    RendererFlip(rawValue: SDL_FLIP_HORIZONTAL.rawValue)
  public static let vertical =
    RendererFlip(rawValue: SDL_FLIP_VERTICAL.rawValue)
}

public class Renderer: SDLObject<SDL_Renderer> {
  public convenience init(window: Window) throws {
    guard let handle =
      SDL_CreateRenderer(OpaquePointer(window.handle), -1,
                         SDL_RENDERER_ACCELERATED.rawValue) else {
                          throw RendererError.nullPointer
    }
    self.init(handle: SDLHandle<SDL_Renderer>(handle))
  }

  public var color: Color {
    get {
      var r: UInt8 = 0
      var g: UInt8 = 0
      var b: UInt8 = 0
      var a: UInt8 = 0
      SDL_GetRenderDrawColor(self.opaquePointer, &r, &g, &b, &a)
      return Color(r: r, g: g, b: b, a: a)
    }
    set {
      SDL_SetRenderDrawColor(self.opaquePointer, newValue.r, newValue.g,
                             newValue.b, newValue.a)
    }
  }

  public func clear() {
    SDL_RenderClear(self.opaquePointer)
  }

  public func present() {
    SDL_RenderPresent(self.opaquePointer)
  }

  public func copy(texture: Texture) {
    SDL_RenderCopy(self.opaquePointer, texture.opaquePointer, nil, nil)
  }

  public func copy(texture: Texture, sourceRect: Rect) {
    var sourceRect = sourceRect
    SDL_RenderCopy(self.opaquePointer, texture.opaquePointer, &sourceRect.sdlStruct, nil)
  }

  public func copy(texture: Texture, destRect: Rect) {
    var destRect = destRect
    SDL_RenderCopy(self.opaquePointer, texture.opaquePointer, nil, &destRect.sdlStruct)
  }

  public func copy(texture: Texture, sourceRect: Rect, destRect:  Rect) {
    var sourceRect = sourceRect
    var destRect = destRect
    SDL_RenderCopy(self.opaquePointer, texture.opaquePointer, &sourceRect.sdlStruct, &destRect.sdlStruct)
  }

  public func copy(texture: Texture, angle: Double,
                   center: Point, flip: RendererFlip) {
    var center = center
    SDL_RenderCopyEx(self.opaquePointer, texture.opaquePointer, nil, nil, angle, &center.sdlStruct, flip.sdlStruct)
  }

  public func copy(texture: Texture, sourceRect: Rect,
                   angle: Double, center: Point, flip: RendererFlip) {
    var sourceRect = sourceRect
    var center = center
    SDL_RenderCopyEx(self.opaquePointer, texture.opaquePointer, &sourceRect.sdlStruct, nil, angle, &center.sdlStruct, flip.sdlStruct)
  }

  public func copy(texture: Texture, destRect: Rect,
                   angle: Double, center: Point, flip: RendererFlip) {
    var destRect = destRect
    var center = center
    SDL_RenderCopyEx(self.opaquePointer, texture.opaquePointer, nil, &destRect.sdlStruct, angle, &center.sdlStruct, flip.sdlStruct)
  }

  public func copy(texture: Texture, sourceRect: Rect,
                   destRect:  Rect, angle: Double, center: Point, flip: RendererFlip) {
    var sourceRect = sourceRect
    var destRect = destRect
    var center = center
    SDL_RenderCopyEx(self.opaquePointer, texture.opaquePointer, &sourceRect.sdlStruct, &destRect.sdlStruct, angle, &center.sdlStruct, flip.sdlStruct)
  }

  public func destroy() {
    SDL_DestroyRenderer(self.opaquePointer)
  }
}
