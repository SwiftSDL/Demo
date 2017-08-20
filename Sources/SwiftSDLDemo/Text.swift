import SwiftSDL

class Text: Renderable {
  var text: String {
    didSet {
      invalidate()
      updateSize()
    }
  }
  let color: Color

  override func makeTexture() throws -> Texture {
    let surface = try Surface(font: font, text: text, color: color)
    return try Texture(renderer: renderer, surface: surface)
  }

  init(renderer: Renderer,
       text: String,
       font: Font,
       color: Color = Color(r: 0, g: 0, b: 0, a: 0),
       position: Point = Point(x: 0, y: 0),
       angle: Double = 0.0,
       flip: RendererFlip = .none) {
    self.text = text
    self.color = color
    let size = TTF.sizeText(font: font, text: text)
    let rect = Rect(x: position.x, y: position.y, w: size.w, h: size.h)
    super.init(renderer: renderer, rect: rect, angle: angle, flip: flip)
  }

  func updateSize() {
    let size = TTF.sizeText(font: font, text: text)
    rect = Rect(x: rect.x, y: rect.y, w: size.w, h: size.h)
  }
}
