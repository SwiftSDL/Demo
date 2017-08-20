import SwiftSDL

extension Renderer {
  func render<T: Renderable>(_ r: T) {
    guard let texture = r.texture else { return }

    if let mask = r.mask {
      self.copy(texture: texture, sourceRect: mask, destRect: r.rect,
                angle: r.angle, center: r.center, flip: r.flip)
    }

    self.copy(texture: texture, destRect: r.rect,
              angle: r.angle, center: r.center, flip: r.flip)
  }
}
