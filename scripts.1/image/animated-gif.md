frame_delay=20   # 20/100 = 0.2 s
convert -delay $frame_delay   -loop 0   *.gif  result.gif

ffmpeg -i animated.gif -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" video.mp4
