#!/usr/bin/env python

import os

os.chdir('/home/anders/Foton')
for root, dirs, files in os.walk('.'):
  dest = os.path.join('..', 'resized_photos', root)
  try:
    os.makedirs(dest)
  except OSError:
    pass
  for name in files:
    if name.lower().endswith('.jpg'):
      orig = os.path.join(root, name)
      resized = os.path.join(dest, name)
      try:
        if os.stat(orig).st_mtime < os.stat(resized).st_mtime:
          continue
      except OSError:
        pass
      print resized
      os.system('convert "%s" -auto-orient -resize 800x800 "%s"' % (orig, resized))

