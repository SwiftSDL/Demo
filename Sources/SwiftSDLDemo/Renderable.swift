import SwiftSDL

class Renderable {
  let renderer: Renderer

  var rect: Rect
  let mask: Rect?
  let center: Point
  let angle: Double
  let flip: RendererFlip

  private var _texture: Texture?
  var texture: Texture? {
    if _texture == nil {
      _texture = try? self.makeTexture()
    }
    return _texture ?? nil
  }

  init(renderer: Renderer, rect: Rect, mask: Rect? = nil,
       center: Point = Point(x: 0, y: 0), angle: Double = 0.0,
       flip: RendererFlip = .none) {
    self.renderer = renderer
    self.rect = rect
    self.mask = mask
    self.angle = angle
    self.center = center
    self.flip = flip
  }

  func makeTexture() throws -> Texture {
    fatalError("must override texture() method")
  }

  func invalidate() {
    self._texture = nil
  }
}
