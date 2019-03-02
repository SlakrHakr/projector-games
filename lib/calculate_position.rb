require 'chunky_png'
include ChunkyPNG::Color

images = [
  ChunkyPNG::Image.from_file('../tmp/screen.png'),
  ChunkyPNG::Image.from_file('../tmp/reality.png')
]

points = []
images.first.height.times do |y|
  images.first.row(y).each_with_index do |pixel, x|

    red = r(pixel) + r(images.last[x,y]) - 2 * [r(pixel), r(images.last[x,y])].min
    green = g(pixel) + g(images.last[x,y]) - 2 * [g(pixel), g(images.last[x,y])].min
    blue = b(pixel) + b(images.last[x,y]) - 2 * [b(pixel), b(images.last[x,y])].min

    images.last[x,y] = rgb(red, green, blue)

    if red > 0 && green > 0 && blue > 0
      point = { x: x, y: y }
      points.push(point)
      p [point, red, green, blue] if red > 0 && green > 0 && blue > 0
    end
  end
end

p "MIN X: #{points.map{ |point| point[:x] }.min}"
p "MAX X: #{points.map{ |point| point[:x] }.max}"
p "MIN Y: #{points.map{ |point| point[:y] }.min}"
p "MAX Y: #{points.map{ |point| point[:y] }.max}"

center = {
  x: points.map{ |point| point[:x] }.min + ((points.map{ |point| point[:x] }.max - points.map{ |point| point[:x] }.min) / 2),
  y: points.map{ |point| point[:y] }.min + ((points.map{ |point| point[:y] }.max - points.map{ |point| point[:y] }.min) / 2)
}
p "CENTER: #{center}"

images.last.save('diff.png')
