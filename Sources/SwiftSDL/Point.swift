import CSDL

public struct Point: SDLStruct {
  public typealias S = SDL_Point

  public static func fromSdlStruct(_ s: SDL_Point) -> Point {
    return Point(x: Int(s.x), y: Int(s.y))
  }

  public var sdlStruct: SDL_Point {
    get {
      return SDL_Point(x: Int32(x), y: Int32(y))
    }
    set {
      self.x = Int(newValue.x)
      self.y = Int(newValue.y)
    }
  }

  public var x: Int = 0
  public var y: Int = 0

  public init(x: Int = 0, y: Int = 0) {
    self.x = x
    self.y = y
  }
}
