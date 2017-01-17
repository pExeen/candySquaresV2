local canvas = love.graphics.newCanvas()
time = 1
screenW, screenH = love.graphics.getDimensions()
screenWMid, screenHMid = screenW / 2, screenH / 2
squareW = 200

function love.update(dt)
  time = time + dt
  racio=love.math.random(love.math.random(300))
  squareW = screenH / racio
  littleSquareW = math.sqrt(squareW*squareW+squareW*squareW)/2
  count = 200*200/(squareW*squareW)
  canvas:renderTo(function()
  r,g,b,a=love.math.random(255), love.math.random(255), love.math.random(255), love.math.random(255);
  for i=0,count do
    x = (love.math.random(screenW/squareW)-1)*squareW
    y = (love.math.random(screenH/squareW)-1)*squareW
    time = 0
    littleSquareX=x+((squareW-littleSquareW)/2)
    littleSquareY=y+((squareW-littleSquareW)/2)
    love.graphics.setColor(r,g,b,a)
    love.graphics.rectangle('fill', x, y, squareW, squareW)
    love.graphics.setColor(255-r,255-g,255-b,a)
    love.graphics.circle('fill', x + squareW/2, y + squareW/2, squareW/2)
    love.graphics.setColor(r,g,b,a)
    love.graphics.rectangle('fill', littleSquareX, littleSquareY, littleSquareW, littleSquareW)
  end
  end);
end

function love.draw()
  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(canvas);
end


function love.keypressed(key)
  if  key == 'escape' then
    love.event.quit()
  end
end
