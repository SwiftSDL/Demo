import CSDL

public struct InitFlags: OptionSet {
  public var rawValue: UInt32
  public init(rawValue: UInt32) {
    self.rawValue = rawValue
  }

  public static var timer =
    InitFlags(rawValue: SDL_INIT_TIMER)
  public static var audio =
    InitFlags(rawValue: SDL_INIT_AUDIO)
  public static var video =
    InitFlags(rawValue: SDL_INIT_VIDEO)
  public static var joystick =
    InitFlags(rawValue: SDL_INIT_JOYSTICK)
  public static var haptic =
    InitFlags(rawValue: SDL_INIT_JOYSTICK)
  public static var gameController =
    InitFlags(rawValue: SDL_INIT_GAMECONTROLLER)
  public static var events =
    InitFlags(rawValue: SDL_INIT_EVENTS)
  public static var noParachute =
    InitFlags(rawValue: SDL_INIT_NOPARACHUTE)
  public static var everything: InitFlags =
    [.timer, .audio, .video, .joystick, .haptic, .gameController, .events]
}

public class SDL {
  public static func initialize(flags: InitFlags) {
    SDL_Init(flags.rawValue)
  }
}

public protocol SDLStruct {
  associatedtype S
  static func fromSdlStruct(_ sdlStruct: S) -> Self
  var sdlStruct: S { get set }
}

public typealias SDLHandle<T> = UnsafeMutablePointer<T>

public class SDLObject<T> {
  public let handle: SDLHandle<T>
  public var opaquePointer: OpaquePointer {
    return OpaquePointer(handle)
  }
  public init(handle: SDLHandle<T>) {
    self.handle = handle
  }
}

// unexposed SDL APIs
public typealias SDL_Window = Any
public typealias SDL_Renderer = Any
