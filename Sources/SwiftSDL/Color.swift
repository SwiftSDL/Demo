import CSDL

public struct Color: SDLStruct {
  public typealias S = SDL_Color

  public static func fromSdlStruct(_ s: SDL_Color) -> Color {
    return Color(r: s.r, g: s.g, b: s.b, a: s.a)
  }

  public var sdlStruct: SDL_Color {
    get {
      return SDL_Color(r: r, g: g, b: b, a: a)
    }
    set {
      self.r = newValue.r
      self.g = newValue.g
      self.b = newValue.b
      self.a = newValue.a
    }
  }

  public var r: UInt8 = 0
  public var g: UInt8 = 0
  public var b: UInt8 = 0
  public var a: UInt8 = 0

  public init(r: UInt8 = 0, g: UInt8 = 0, b: UInt8 = 0, a: UInt8 = 0) {
    self.r = r
    self.g = g
    self.b = b
    self.a = a
  }
}
