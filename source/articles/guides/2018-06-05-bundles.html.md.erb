---

title: Loading Resources with Bundles
date: 2018-06-05 10:00 UTC
author: Andrew Cain
author_url:
tags: starter
summary: |
  Simplify the process of loading your program's resources using a resource bundle. This file lists the different resources you want loaded, which can then be loaded and freed as a group.
related_funcs:
  - load_resource_bundle
  - free_resource_bundle

---


Games often require a large number of resources. With different levels, characters, animations, music, and sound effects, it can be cumbersome to have to load each of these individually in your code. To help overcome this, SplashKit provides bundles.

### Bundle Contents

Conceptually, a bundle is a collection of resources that can be loaded by SplashKit as a group. This is achieved by creating a bundle script that lists all of the resources that you want loaded, and then loading this bundle in your code by calling using the <%= link_to "Load Resource Bundle", "/api/resource-bundles/#load-resource-bundle" %>. You can then use the resources loaded, accessing them by name. Once you're done with a bundle you can release it from memory by calling <%= link_to "Free Resource Bundle", "/api/resource-bundles/#free-resource-bundle" %>. This releases all the resources loaded in the bundle from memory.

The bundle scripts are located in the *Resources/bundles* folder. Each script is a text file that contains the details of the resources to load. Each line of the file describes a single resource, with comma separated fields. The first field contains the type of resource to load being one of the following:

* **ANIM** to load an animation
* **BITMAP** to load an image
* **BUNDLE** to load another bundle
* **FONT** to load a font
* **MUSIC** to load music
* **SOUND** to load a sound effect
* **TIMER** to create a timer.

Following the resource kind is the resources name and the associated filename for the resource. The name is used to access the resource once the bundle is loaded, while the filename indicates which resource to load. You need to ensure that the names are unique for each resource otherwise some of the resources will not be accessible.

### Extra Details

Bitmap and font resources also require additional information.

**BITMAP** can optionally be followed by bitmap cell details useful for animation (see <% link_to "Using Animations", "/articles/guides/tags/animations/animation/"%>). This is in the format: `BITMAP, name, filename, width, height, cellCols, cellRows, cellCount`. Once the bitmap is loaded the bundle will set the cell details from the information given.

**FONT** must be followed by the point size for the font. 


### Example

The following is an example of a bundle script file, it includes an example of each resource kinds you can load in SplashKit.

```
BITMAP,mySpriteSheet,image1_name.png, 500, 100, 10, 2, 19 
BITMAP,myBitmap,image2_name.png 
ANIM,myAnimation,anim_name.txt 
SOUND,mySound,sound_name.wav 
MUSIC,myMusic,music_name.ogg 
FONT,myFont,font_name.ttf,14 
BUNDLE,myBundle,bundle_name.txt 
```

As you can see from the example, bundles can load a variety of resources including other bundles. Bitmaps can be loaded with cells and without cells.
