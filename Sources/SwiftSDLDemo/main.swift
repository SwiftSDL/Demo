import SwiftSDL
import CSDL
import CSDLImage
import CSDLTTF

import Dispatch

SDL.initialize(flags: [])
TTF.initialize()

let window = try Window(title: "Image Loading", x: 100, y: 100,
                        w: 800, h: 600,
                        flags: SDL_WINDOW_ALLOW_HIGHDPI.rawValue)

let renderer = try Renderer(window: window)

let rect = Rect(x: 300, y: 300, w: 300, h: 300)
let image = try Image(renderer: renderer, file: "image.png", rect: rect)

let font = try Font(file: "./Arial.ttf", size: 64)
let text = Text(renderer: renderer, text: "FPS: 0", font: font)

var now: UInt64    = SDL_GetPerformanceCounter()
var before: UInt64 = UInt64(0)

while true {
  var e = SDL_Event()
  if SDL_PollEvent(&e) != 0 {
    if e.type == SDL_QUIT.rawValue {
      break
    }
  }

  before = now;
  now = SDL_GetPerformanceCounter();

  let dt = Double(now - before)*1000.0 / Double(SDL_GetPerformanceFrequency())

  text.text = "FPS: \(dt)"

  renderer.color = .white
  renderer.clear()

  renderer.render(image)
  renderer.render(text)

  renderer.present()
}
