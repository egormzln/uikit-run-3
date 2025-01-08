# Linked Animation Task

This project demonstrates a linked animation in a Swift-based application. The interface includes a square view and a slider, which together create a dynamic, interactive experience. As the slider moves, the square view animates across the screen with rotation and scaling effects.

![ScreenRecording2024-11-09at20 34 09-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/5bea21ca-f3ff-4104-88bb-a2910722feb1)

## Overview

The primary goal of this project is to animate a square view across the screen with specific transformations as the slider is adjusted:

- **Positioning**: The view moves from the left edge to the right edge of the screen.
- **Rotation and Scaling**: The view rotates 90 degrees and scales up to 1.5x its original size.
- **Animation Continuity**: When the slider is released, the animation continues smoothly to the endpoint from its current position.

## Animation Details

- **End State**: At the final position (right edge of the screen), the view:
  - Aligns to the right with a layout margin offset.
  - Scales to 1.5 times its original size.
  - Rotates by 90 degrees.
- **Continuous Animation**: When the slider is released at any point, the view completes the animation to the final state without abrupt jumps.
- **Layout Margins**: Both the square view and the slider respect the layout margins on the left and right sides for consistent spacing across devices.
