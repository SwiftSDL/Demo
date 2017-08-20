import CSDLTTF

public typealias TTF_Font = Any

public class TTF {
  public static func initialize() {
    TTF_Init()
  }

  public static func sizeText(font: Font, text: String) -> (w: Int, h: Int) {
    var w: Int32 = 0
    var h: Int32 = 0
    TTF_SizeText(font.opaquePointer, text, &w, &h)
    return (w: Int(w), h: Int(h))
  }
}
