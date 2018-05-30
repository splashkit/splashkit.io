---

title: Understanding Double Buffering
date: 2018-05-30 10:00 UTC
author: Various
author_url:
tags: starter
summary: |
  SplashKit uses double buffering to make animations smooth, but this means you need to do a few steps in order to get images appearing on the screen as you expect. In this article we discuss the basics of double buffering and the idea of the painters model.
related_funcs:
  - open_window
  - delay
  - clear_screen
  - refresh_screen

---

Why do we need to [Refresh Screen](/api/graphics#refresh_screen)?

## Double Buffering

SplashKit uses a technique called Double Buffering to ensure you have control over how things appear on the screen.  In this technique you draw to a background canvas and then call `Refresh Screen` to make that canvas appear to the user.

This means you control when something appears on the screen which is important when coordinating a number of shapes, sprites, images or text.

The four images below execute the following pseudo code.

```
call Fill  Triangle() 
call Fill  Rectangle() 
call Fill  Circle() 
call Refresh Screen() 
```

<img alt="Visualisation of the pseudocode running." src="/images/articles/starter/double_buffer/draw_shapes.png" style="width: 700px"></img>

## The Painter Model

Drawing shapes, sprites or other devices into a window is similar to an artist painting on a canvas. Once a brush stroke has been applied, you cannot insert anything underneath it. To insert a shape, sprite, image or text you will need to clear the screen and redraw the items in to the order you need them to render. As discussed above, it is important to note that SplashKit executes the commands top -> down. However they are displayed bottom up. Take a look at the images below and the pseudo code. They will give you a better understanding of the Painter Model.

<img alt="Code is top down, appearance is bottom up." src="/images/articles/starter/double_buffer/painter-new.jpg" style="width: 700px"></img>

So when drawing you need to keep two things in mind:

1. Anything you draw will not appear unit you have refreshed the screen
1. Newer drawing operations will draw over the current canvas, on top of anything that was already there