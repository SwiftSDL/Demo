import SwiftSDL

class Image: Renderable {
  let file: String
  
  init(renderer: Renderer,
       file: String,
       rect: Rect,
       angle: Double = 0.0,
       flip: RendererFlip = .none) throws {
    self.file = file
    super.init(renderer: renderer, rect: rect, angle: angle, flip: flip)
  }

  override func makeTexture() throws -> Texture {
    return try Texture(renderer: renderer, file: file)
  }
}
