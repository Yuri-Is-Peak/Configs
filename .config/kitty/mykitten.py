from kittens.tui.handler import Handler
from kittens.tui.loop import Loop
from time import sleep

   # self.cmd.set_cursor_position(0, 0)


class MyHandler(Handler):
    def initialize(self):
        self.Draw()

    def Draw(self):
        self.Y = self.screen_size.rows
        self.X = self.screen_size.cols
        Screen = ProcessRender(self.X, self.Y)
        self.print(Screen)

    def on_key(self, key_event):
        if key_event.key == "q":
            self.quit_loop(0)





def main(args):
    loop = Loop()
    handler = MyHandler()
    loop.loop(handler)

def ProcessRender(X, Y):
    Render = ""
    Line = 1
    Multiplier = 0.2
    i = 0
    Limit = round(Y * Multiplier)
    while i < Limit:
        Render +=("_" * round(X * Multiplier))
        Render += "A"
        Render += " " * round(X - (X * Multiplier) - 1)
        i +=1
    return Render











