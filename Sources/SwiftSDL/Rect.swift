import CSDL

public struct Rect: SDLStruct {
  public typealias S = SDL_Rect

  public static func fromSdlStruct(_ s: SDL_Rect) -> Rect {
    return Rect(x: Int(s.x), y: Int(s.y), w: Int(s.w), h: Int(s.h))
  }

  public var sdlStruct: SDL_Rect {
    get {
      return SDL_Rect(x: Int32(x), y: Int32(y), w: Int32(w), h: Int32(h))
    }
    set {
      self.x = Int(newValue.x)
      self.y = Int(newValue.y)
      self.w = Int(newValue.w)
      self.h = Int(newValue.h)
    }
  }

  public var x: Int = 0
  public var y: Int = 0
  public var w: Int = 0
  public var h: Int = 0

  public init(x: Int = 0, y: Int = 0, w: Int = 0, h: Int = 0) {
    self.x = x
    self.y = y
    self.w = w
    self.h = h
  }
}
